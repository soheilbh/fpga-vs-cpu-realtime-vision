"""
Test script for generating frames with all 26 letters (A-Z).

This script demonstrates three ways to generate the full alphabet frame:
1. With default noise settings
2. With noise forced on
3. With noise forced off
"""

import os
import cv2
import numpy as np
from pathlib import Path
import sys

# Add parent directory to Python path for imports
sys.path.append('..')

from src.frame_generator.generator import FrameGenerator

# Configuration
ENABLE_NOISE = True # Set to True for noisy frame, False for clean frame
OUTPUT_DIR = "../output/frames/full_alphabet/"

def save_and_show_frame(frame: np.ndarray):
    """
    Save frame as PNG and NPY, and display it.
    
    Args:
        frame (np.ndarray): Frame to save and display
    """
    # Create output directory
    output_dir = Path(OUTPUT_DIR)
    output_dir.mkdir(parents=True, exist_ok=True)
    
    # Generate filename based on noise setting
    noise_suffix = "with_noise" if ENABLE_NOISE else "without_noise"
    
    # Save as PNG
    png_path = output_dir / f"full_alphabet_{noise_suffix}.png"
    cv2.imwrite(str(png_path), frame)
    print(f"Saved PNG: {png_path}")
    
    # Save as NPY
    npy_path = output_dir / f"full_alphabet_{noise_suffix}.npy"
    np.save(str(npy_path), frame)
    print(f"Saved NPY: {npy_path}")
    
    # Display frame
    cv2.imshow(f"Full Alphabet Frame ({noise_suffix})", frame)
    cv2.waitKey(0)
    cv2.destroyAllWindows()

def main():
    # Initialize frame generator
    generator = FrameGenerator()
    
    # Generate frame with specified noise setting
    print(f"\nGenerating frame with noise {'enabled' if ENABLE_NOISE else 'disabled'}...")
    frame = generator.generate_full_alphabet_frame(enable_noise=ENABLE_NOISE)
    save_and_show_frame(frame)

if __name__ == "__main__":
    main() 