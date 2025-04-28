"""
Frame Generator Module

This module is responsible for generating frames with letters and noise for processing.
It creates test frames that will be used to compare FPGA and CPU processing performance.
"""

import numpy as np
from settings.config import (
    FRAME_WIDTH,
    FRAME_HEIGHT,
    NOISE_PERCENTAGE,
    MAX_LETTERS_PER_FRAME,
)

class FrameGenerator:
    """
    Generates frames with letters and noise for processing.
    
    Attributes:
        width (int): Width of the generated frames
        height (int): Height of the generated frames
        noise_percentage (float): Percentage of noise to add to frames
        max_letters (int): Maximum number of letters per frame
    """
    
    def __init__(self):
        """Initialize the frame generator with configuration parameters."""
        self.width = FRAME_WIDTH
        self.height = FRAME_HEIGHT
        self.noise_percentage = NOISE_PERCENTAGE
        self.max_letters = MAX_LETTERS_PER_FRAME

    def generate_frame(self) -> np.ndarray:
        """
        Generate a single frame with letters and noise.
        
        Returns:
            np.ndarray: A 2D numpy array representing the frame
        """
        # Create empty frame
        frame = np.zeros((self.height, self.width), dtype=np.uint8)
        
        # TODO: Implement letter generation
        # TODO: Add noise
        # TODO: Return processed frame
        
        return frame
