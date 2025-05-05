"""
Test script to generate frames with fixed letter combinations from the mapping table.
"""

import sys
import os
import json
import numpy as np
from datetime import datetime
from pathlib import Path

# Add src directory to Python path for imports
sys.path.append(str(Path(__file__).parent.parent / 'src'))

import cv2
from frame_generator.generator import FrameGenerator

def load_combination(target_char: str) -> list:
    """
    Load the letter combination for a target character from the mapping table.
    
    Args:
        target_char (str): Target character to find combination for
        
    Returns:
        List[str]: List of 10 letters for the combination
    """
    try:
        mapping_file = Path("output/combination_batch_plan.json")
        with open(mapping_file, 'r') as f:
            mapping_data = json.load(f)
        
        if target_char not in mapping_data:
            raise ValueError(f"No combination found for character '{target_char}'")
        
        return mapping_data[target_char]["combination"]
    
    except FileNotFoundError:
        raise FileNotFoundError(f"Mapping table file not found: {mapping_file}")
    except json.JSONDecodeError:
        raise ValueError("Invalid JSON format in mapping table file")

def is_valid_character(char: str) -> bool:
    """
    Check if a character is valid (A-Z or asterisk).
    
    Args:
        char (str): Character to validate
        
    Returns:
        bool: True if character is valid, False otherwise
    """
    return (len(char) == 1 and 
            (char.isalpha() and char.isupper() or char == '*'))

def create_empty_frame(generator: FrameGenerator) -> np.ndarray:
    """
    Create a frame with only background and noise, no letters.
    
    Args:
        generator (FrameGenerator): Frame generator instance
        
    Returns:
        np.ndarray: Empty frame with background and noise
    """
    # Create frame with background intensity
    frame = np.full((generator.height, generator.width), generator.background_intensity, dtype=np.uint8)
    
    # Add noise if enabled
    if generator.enable_noise:
        total_pixels = generator.width * generator.height
        noise_pixel_count = int(total_pixels * generator.noise_percentage)
        
        # Generate random coordinates for noise pixels
        noise_x = np.random.randint(0, generator.width, size=noise_pixel_count)
        noise_y = np.random.randint(0, generator.height, size=noise_pixel_count)
        
        # Set noise pixels to black (0)
        frame[noise_y, noise_x] = generator.noise_color
    
    return frame

def main():
    """Main function to run the batch frame generator."""
    # Read input text
    try:
        with open('input/input.txt', 'r') as f:
            input_text = f.read().strip()
    except FileNotFoundError:
        print("Error: input.txt file not found")
        return 1
    except Exception as e:
        print(f"Error reading input.txt: {e}")
        return
    
    # Validate input string
    if not input_text:
        print("Error: input.txt is empty")
        return
    
    # Create output directory
    base_output_dir = Path("output/batches")
    output_dir = base_output_dir / input_text.replace(' ', '_')
    output_dir.mkdir(parents=True, exist_ok=True)
    
    print(f"\nGenerating frames in directory: {output_dir}")
    
    # Process each character in the input string
    for index, char in enumerate(input_text):
        # Convert space to asterisk
        if char == ' ':
            char = '*'
        
        try:
            # Load letter combination
            letters = load_combination(char)
            print(f"\nProcessing character '{char}' at position {index}:")
            print(f"Loaded combination: {letters}")
            
            # Initialize frame generator and generate frame
            generator = FrameGenerator()
            frame = generator.generate_frame(letters=letters)
            
            # Generate base filename with index
            filename_char = 'asterisk' if char == '*' else char
            base_filename = output_dir / f"batch_{filename_char}_{index}"
            
            # Save as PNG
            png_filename = f"{base_filename}.png"
            cv2.imwrite(png_filename, frame)
            print(f"Frame saved as PNG: {png_filename}")
            
            # Save as NPY
            npy_filename = f"{base_filename}.npy"
            np.save(npy_filename, frame)
            print(f"Frame saved as NPY: {npy_filename}")
            
            # Print frame information
            print(f"Frame shape: {frame.shape}")
            print(f"Frame dtype: {frame.dtype}")
            print(f"Frame min/max values: {frame.min()}/{frame.max()}")
            
            # Display the frame
            cv2.imshow(f'Generated Batch Frame - {char} (Position {index})', frame)
            
            # Wait for key press
            print("Press any key to continue to next character...")
            cv2.waitKey(0)
            cv2.destroyAllWindows()
            
        except Exception as e:
            print(f"Error processing character '{char}': {e}")
            continue
    
    # Generate and save empty noise frame
    try:
        print("\nGenerating empty noise frame...")
        generator = FrameGenerator()
        # Pass an empty list to generate_frame to create a frame with no letters
        empty_frame = generator.generate_frame(letters=[])
        
        # Generate filename
        base_filename = output_dir / "empty_batch"
        
        # Save as PNG
        png_filename = f"{base_filename}.png"
        cv2.imwrite(png_filename, empty_frame)
        
        # Save as NPY
        npy_filename = f"{base_filename}.npy"
        np.save(npy_filename, empty_frame)
        print(f"Saved empty batch frame as {npy_filename}")
        
    except Exception as e:
        print(f"Error generating empty frame: {e}")

if __name__ == "__main__":
    main() 