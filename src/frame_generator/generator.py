"""
Frame Generator Module

This module is responsible for generating frames with letters and noise for processing.
It creates test frames that will be used to compare FPGA and CPU processing performance.
"""

import numpy as np
import cv2
import random
import string
from typing import List, Tuple, Optional
from settings.config import (
    FRAME_WIDTH,
    FRAME_HEIGHT,
    ENABLE_NOISE,
    NOISE_PERCENTAGE,
    NOISE_COLOR,
    LETTER_COUNT,
    LETTER_FONT_SCALE,
    LETTER_THICKNESS,
    LETTER_FONT,
    LETTER_COLOR,
    BACKGROUND_INTENSITY,
)

class FrameGenerator:
    """
    Generates frames with letters and noise for processing.
    
    Attributes:
        width (int): Width of the generated frames
        height (int): Height of the generated frames
        enable_noise (bool): Whether to add noise to frames
        noise_percentage (float): Percentage of noise to add to frames (0-0.04)
        noise_color (int): Intensity of noise pixels (0-255, where 0 is black)
        letter_count (int): Fixed number of letters per frame
        font_scale (float): Font scale for letters
        font (int): OpenCV font type for letters
        letter_thickness (int): Thickness of letter strokes
        letter_color (int): Intensity of letter pixels (0-255, where 255 is white)
        background_intensity (int): Intensity of background pixels (0-255, where 0 is black)
    """
    
    def __init__(self):
        """Initialize the frame generator with configuration parameters."""
        self.width = FRAME_WIDTH
        self.height = FRAME_HEIGHT
        self.enable_noise = ENABLE_NOISE
        self.noise_percentage = NOISE_PERCENTAGE
        self.noise_color = NOISE_COLOR
        self.letter_count = LETTER_COUNT
        self.font_scale = LETTER_FONT_SCALE
        self.font = LETTER_FONT
        self.letter_thickness = LETTER_THICKNESS
        self.letter_color = LETTER_COLOR
        self.background_intensity = BACKGROUND_INTENSITY

    def _post_process_frame(self, frame: np.ndarray) -> np.ndarray:
        """
        Post-process the frame to ensure only three pixel values:
        - 255 (letters)
        - 80 (background)
        - 0 (noise)
        
        Args:
            frame (np.ndarray): Input frame to process
            
        Returns:
            np.ndarray: Processed frame with only three pixel values
        """
        # Set any pixel between background and letter color back to background
        frame[np.logical_and(frame > self.background_intensity, frame < self.letter_color)] = self.background_intensity
        return frame

    def _check_collision(self, x: int, y: int, width: int, height: int, used_areas: List[Tuple[int, int, int, int]]) -> bool:
        """
        Check if a new letter would collide with existing letters.
        
        Args:
            x (int): X coordinate of new letter
            y (int): Y coordinate of new letter
            width (int): Width of new letter
            height (int): Height of new letter
            used_areas (List[Tuple[int, int, int, int]]): List of (x, y, width, height) for existing letters
            
        Returns:
            bool: True if collision detected, False otherwise
        """
        # Add padding around letters to prevent touching
        padding = 5
        x1 = x - padding
        y1 = y - height - padding
        x2 = x + width + padding
        y2 = y + padding
        
        for (ux, uy, uw, uh) in used_areas:
            # Check if rectangles overlap
            if not (x2 < ux or x1 > ux + uw or y2 < uy or y1 > uy + uh):
                return True
        return False

    def generate_frame(self, letters: Optional[List[str]] = None) -> np.ndarray:
        """
        Generate a single frame with letters and noise.
        
        Args:
            letters (Optional[List[str]]): List of letters to place on the frame.
                If None, random letters will be generated.
            
        Returns:
            np.ndarray: A 2D numpy array of type uint8 representing the frame
        """
        # Create frame with background intensity
        frame = np.full((self.height, self.width), self.background_intensity, dtype=np.uint8)
        
        # Add noise if enabled (before drawing letters)
        if self.enable_noise:
            total_pixels = self.width * self.height
            noise_pixel_count = int(total_pixels * self.noise_percentage)
            
            # Generate random coordinates for noise pixels
            noise_x = np.random.randint(0, self.width, size=noise_pixel_count)
            noise_y = np.random.randint(0, self.height, size=noise_pixel_count)
            
            # Set noise pixels to black (0)
            frame[noise_y, noise_x] = self.noise_color
        
        # Track used areas to prevent overlap
        used_areas = []
        max_attempts = 100  # Maximum attempts to place each letter
        
        # Determine letters to use
        if letters is None:
            # Generate random letters if none provided
            letters_to_place = [random.choice(string.ascii_uppercase) for _ in range(self.letter_count)]
        else:
            # Use provided letters
            letters_to_place = letters
        
        # Place letters on frame (overwriting any noise)
        for letter in letters_to_place:
            # Calculate text size to ensure it fits within frame
            (text_width, text_height), _ = cv2.getTextSize(
                letter, self.font, self.font_scale, self.letter_thickness
            )
            
            # Add safe boundary margin (20% of text size)
            safe_margin = int(max(text_width, text_height) * 0.2)
            
            # Try to place letter without collision
            placed = False
            attempts = 0
            
            while not placed and attempts < max_attempts:
                # Generate random position ensuring text fits within frame with safe margins
                x = np.random.randint(safe_margin, self.width - text_width - safe_margin)
                y = np.random.randint(text_height + safe_margin, self.height - safe_margin)
                
                # Check for collision
                if not self._check_collision(x, y, text_width, text_height, used_areas):
                    # Draw letter
                    cv2.putText(
                        frame,
                        letter,
                        (x, y),
                        self.font,
                        self.font_scale,
                        self.letter_color,
                        self.letter_thickness,
                        lineType=cv2.LINE_8  # Use LINE_8 for crisp, non-anti-aliased text
                    )
                    # Add to used areas
                    used_areas.append((x, y - text_height, text_width, text_height))
                    placed = True
                
                attempts += 1
            
            if not placed:
                print(f"Warning: Could not place letter '{letter}' after {max_attempts} attempts")
        
        # Post-process frame to ensure only three pixel values
        frame = self._post_process_frame(frame)
        
        return frame

    def generate_full_alphabet_frame(self, enable_noise: Optional[bool] = None) -> np.ndarray:
        """
        Generate a special frame containing all 26 letters (A-Z).
        
        The frame is created with a gray background (intensity 80), white letters (intensity 255),
        and black noise pixels (intensity 0). Letters are arranged in a grid pattern.
        
        Args:
            enable_noise (bool, optional): Whether to add noise to the frame.
                If None, uses the class's enable_noise setting.
                If True/False, overrides the class setting for this call.
                
        Returns:
            np.ndarray: Generated frame with all 26 letters arranged in a grid.
        """
        # Create frame with background intensity
        frame = np.full((self.height, self.width), self.background_intensity, dtype=np.uint8)
        
        # Add noise if enabled (before drawing letters)
        should_add_noise = enable_noise if enable_noise is not None else self.enable_noise
        if should_add_noise:
            total_pixels = self.width * self.height
            noise_pixel_count = int(total_pixels * self.noise_percentage)
            
            # Generate random coordinates for noise pixels
            noise_x = np.random.randint(0, self.width, size=noise_pixel_count)
            noise_y = np.random.randint(0, self.height, size=noise_pixel_count)
            
            # Set noise pixels to black (0)
            frame[noise_y, noise_x] = self.noise_color
        
        # Grid layout: 5 rows × 6 columns (last row has 6 letters)
        rows = 5
        cols = 6
        
        # Calculate cell dimensions
        cell_width = self.width // cols
        cell_height = self.height // rows
        
        # Get text size for centering
        (text_width, text_height), _ = cv2.getTextSize(
            "A", self.font, self.font_scale, self.letter_thickness
        )
        
        # Place each letter in its cell (overwriting any noise)
        for i, letter in enumerate(string.ascii_uppercase + "*"):
            # Calculate grid position
            row = i // cols
            col = i % cols
            
            # Calculate cell center
            cell_center_x = col * cell_width + cell_width // 2
            cell_center_y = row * cell_height + cell_height // 2
            
            # Calculate text position (centered in cell)
            text_x = cell_center_x - text_width // 2
            text_y = cell_center_y + text_height // 2
            
            # Draw letter
            cv2.putText(
                frame,
                letter,
                (text_x, text_y),
                self.font,
                self.font_scale,
                self.letter_color,
                self.letter_thickness,
                lineType=cv2.LINE_8  # Use LINE_8 for crisp, non-anti-aliased text
            )
        
        # Post-process frame to ensure only three pixel values
        frame = self._post_process_frame(frame)
        
        return frame
