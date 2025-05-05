"""
Configuration settings for the FPGA vs CPU real-time vision project.
"""

import cv2

# Frame Generation Settings
FRAME_WIDTH = 800
FRAME_HEIGHT = 600
TARGET_FPS = 32
VIDEO_DURATION = 10  # Duration of video in seconds
BACKGROUND_INTENSITY = 100  # Background intensity (0-255, where 0 is black)

# Noise Settings
ENABLE_NOISE = True  # Enable/disable noise generation
NOISE_PERCENTAGE = 0.1  # Percentage of frame pixels to be noise (0-0.04 or 0-4%)
NOISE_COLOR = 0  # Noise pixel intensity (0-255, where 0 is black)

# Letter Generation Settings
LETTER_COUNT = 1  # Fixed number of letters per frame
LETTER_FONT_SCALE = 2.8  # Base font scale for letters
LETTER_THICKNESS = 2  # Thickness of letter strokes
LETTER_FONT = cv2.FONT_HERSHEY_PLAIN  # Font type for letters
LETTER_COLOR = 255  # Letter color intensity (0-255, where 255 is white)

# Detection Settings
BRIGHT_PIXEL_THRESHOLD = 160  # Pixel intensity threshold for detection (must be > BACKGROUND_INTENSITY)
MIN_BLOB_SIZE = 10  # Minimum number of pixels for a valid blob
MAX_BLOB_SIZE = 1000  # Maximum number of pixels for a valid blob 