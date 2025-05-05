"""
Detection Module

This module handles the detection of bright pixels and blobs in frames.
It implements the first stage of the processing pipeline for both FPGA and CPU implementations.
"""

from typing import List, Dict, Tuple
from settings.config import (
    BRIGHT_PIXEL_THRESHOLD,
    FRAME_WIDTH,
    FRAME_HEIGHT,
)

class BlobOutput:
    """Struct-like class to store blob properties, matching FPGA implementation"""
    def __init__(self):
        self.min_x = FRAME_WIDTH
        self.min_y = FRAME_HEIGHT
        self.max_x = 0
        self.max_y = 0
        self.prefix_sum = 0  # Use regular Python int

class Detector:
    """
    Detects the first bright blob in frames using thresholding and connected component analysis.
    Implementation matches FPGA version for fair comparison.
    """
    
    def __init__(self):
        """Initialize the detector with configuration parameters."""
        self.threshold = BRIGHT_PIXEL_THRESHOLD
        self.max_queue_size = 1024  # Power of 2 for better HLS optimization
        self.max_prefix_sum = 512  # Power of 2, enough for max observed 289

    def _is_bright_pixel(self, pixel: int) -> bool:
        """Check if pixel is above threshold."""
        return pixel > self.threshold

    def _get_neighbors(self, x: int, y: int, neighbors: List[List[int]]) -> int:
        """
        Get 4-neighbors of a pixel (up, down, left, right).
        Matches FPGA implementation with fixed-size array and count.
        """
        count = 0
        
        # Up
        if y > 0:
            neighbors[count][0] = x
            neighbors[count][1] = y - 1
            count += 1
        
        # Down
        if y < FRAME_HEIGHT - 1:
            neighbors[count][0] = x
            neighbors[count][1] = y + 1
            count += 1
        
        # Left
        if x > 0:
            neighbors[count][0] = x - 1
            neighbors[count][1] = y
            count += 1
        
        # Right
        if x < FRAME_WIDTH - 1:
            neighbors[count][0] = x + 1
            neighbors[count][1] = y
            count += 1
        
        return count

    def _flood_fill(self, frame: List[List[int]], start_x: int, start_y: int, blob: BlobOutput) -> None:
        """
        Perform flood-fill to find connected components and calculate prefix sum.
        Matches FPGA implementation with fixed-size queue and visited array.
        """
        # Initialize visited array
        visited = [[0 for _ in range(FRAME_WIDTH)] for _ in range(FRAME_HEIGHT)]
        
        # Initialize queue with fixed size
        queue_x = [0] * self.max_queue_size
        queue_y = [0] * self.max_queue_size
        queue_front = 0
        queue_back = 0
        
        # Add starting point to queue
        queue_x[queue_back] = start_x
        queue_y[queue_back] = start_y
        queue_back = (queue_back + 1) % self.max_queue_size
        visited[start_y][start_x] = 1
        
        while queue_front != queue_back:
            # Get next point from queue
            x = queue_x[queue_front]
            y = queue_y[queue_front]
            queue_front = (queue_front + 1) % self.max_queue_size
            
            # Update blob properties
            blob.min_x = min(blob.min_x, x)
            blob.min_y = min(blob.min_y, y)
            blob.max_x = max(blob.max_x, x)
            blob.max_y = max(blob.max_y, y)
            
            # Add 1 to prefix sum for each bright pixel (matches FPGA)
            if self._is_bright_pixel(frame[y][x]):
                if blob.prefix_sum < self.max_prefix_sum:
                    blob.prefix_sum += 1
            
            # Get neighbors
            neighbors = [[0, 0] for _ in range(4)]
            num_neighbors = self._get_neighbors(x, y, neighbors)
            
            # Process neighbors
            for i in range(num_neighbors):
                nx, ny = neighbors[i]
                if not visited[ny][nx] and self._is_bright_pixel(frame[ny][nx]):
                    visited[ny][nx] = 1
                    queue_x[queue_back] = nx
                    queue_y[queue_back] = ny
                    queue_back = (queue_back + 1) % self.max_queue_size

    def detect(self, frame: List[List[int]]) -> BlobOutput:
        """
        Detect the first blob in the input frame.
        Matches FPGA implementation by returning after finding first blob.
        
        Args:
            frame (List[List[int]]): Input grayscale frame of shape (FRAME_HEIGHT, FRAME_WIDTH)
            
        Returns:
            BlobOutput: Detected blob properties
        """
        blob = BlobOutput()
        
        # Find first valid blob
        for y in range(FRAME_HEIGHT):
            for x in range(FRAME_WIDTH):
                if self._is_bright_pixel(frame[y][x]):
                    self._flood_fill(frame, x, y, blob)
                    return blob
        
        return blob
