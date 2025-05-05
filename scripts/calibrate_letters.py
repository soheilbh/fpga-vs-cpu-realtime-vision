"""
Calibration Module

This module handles the calibration of letters by analyzing a frame containing all 26 letters.
It creates a mapping between letters and their corresponding prefix sums for use in recognition.
"""

import os
import sys
import numpy as np
import json
import matplotlib.pyplot as plt
from pathlib import Path
from typing import List, Dict

# Add src directory to Python path for imports
sys.path.append(str(Path(__file__).parent.parent / 'src'))

from detection.detector import Detector, BlobOutput

# Configuration
USE_NOISY_FRAME = True # Set to True to use noisy frame, False for clean frame

def detect_all_blobs(frame: np.ndarray, detector: Detector) -> List[BlobOutput]:
    """
    Detect all blobs in the frame by scanning and marking visited pixels.
    
    Args:
        frame (np.ndarray): Input frame
        detector (Detector): Detector instance
        
    Returns:
        List[BlobOutput]: List of detected blobs
    """
    visited = np.zeros_like(frame, dtype=bool)
    blobs = []
    
    for y in range(frame.shape[0]):
        for x in range(frame.shape[1]):
            if not visited[y, x] and frame[y, x] > detector.threshold:
                # Create a temporary frame with only unvisited pixels
                temp_frame = frame.copy()
                temp_frame[visited] = 0
                
                # Detect blob
                blob = detector.detect(temp_frame)
                
                # Mark the blob's area as visited
                visited[blob.min_y:blob.max_y+1, blob.min_x:blob.max_x+1] = True
                
                # Add blob to list
                blobs.append(blob)
    
    return blobs

def sort_blobs_by_position(blobs: List[BlobOutput]) -> List[BlobOutput]:
    """
    Sort blobs based on their position (left to right, top to bottom).
    First sorts by row (y-coordinate), then within each row by column (x-coordinate).
    
    Args:
        blobs (List[BlobOutput]): List of detected blobs
        
    Returns:
        List[BlobOutput]: Sorted list of blobs
    """
    # First sort by y-coordinate (top to bottom)
    sorted_by_y = sorted(blobs, key=lambda b: b.min_y)
    
    # Group by rows (assuming 5 rows of letters)
    rows = []
    current_row = []
    current_y = None
    
    for blob in sorted_by_y:
        y = blob.min_y
        if current_y is None:
            current_y = y
            current_row.append(blob)
        elif abs(y - current_y) < 100:  # Threshold for same row
            current_row.append(blob)
        else:
            # Sort current row by x-coordinate and add to rows
            rows.append(sorted(current_row, key=lambda b: b.min_x))
            current_row = [blob]
            current_y = y
    
    # Add the last row
    if current_row:
        rows.append(sorted(current_row, key=lambda b: b.min_x))
    
    # Flatten the rows into a single list
    return [blob for row in rows for blob in row]

def visualize_calibration(frame: np.ndarray, blobs: List[BlobOutput], letter_map: Dict[str, int], save_path: str = None):
    """
    Visualize the calibration results showing each letter with its prefix sum.
    
    Args:
        frame (np.ndarray): Original frame
        blobs (List[BlobOutput]): List of detected blobs
        letter_map (Dict[str, int]): Mapping of letters to prefix sums
        save_path (str, optional): Path to save the visualization
    """
    plt.figure(figsize=(15, 15))
    plt.imshow(frame, cmap='gray', vmin=0, vmax=255)
    
    # Plot each blob with its letter and prefix sum
    for i, blob in enumerate(blobs):
        if i < 26:
            letter = chr(ord('A') + i)
        else:
            letter = '*'
        prefix_sum = letter_map[letter]
        
        # Plot blob bounds
        plt.plot([blob.min_x, blob.max_x, blob.max_x, blob.min_x, blob.min_x],
                [blob.min_y, blob.min_y, blob.max_y, blob.max_y, blob.min_y],
                'r-', linewidth=1)
        
        # Add text label
        center_x = (blob.min_x + blob.max_x) // 2
        center_y = (blob.min_y + blob.max_y) // 2
        plt.text(center_x, center_y, 
                f"{letter}\nSum: {prefix_sum}",
                color='yellow', ha='center', va='center',
                bbox=dict(facecolor='black', alpha=0.5))
    
    plt.title('Letter Calibration Results')
    plt.tight_layout()
    
    if save_path:
        plt.savefig(save_path)
        print(f"Visualization saved to: {save_path}")
    
    plt.show()

def main():
    """
    Main calibration function that:
    1. Loads a frame containing all 26 letters
    2. Detects blobs in the frame
    3. Maps each blob to a letter based on position
    4. Saves the mapping to a JSON file
    """
    print("Starting letter calibration...")
    
    # Create output directory
    output_dir = Path("output/calibration")
    output_dir.mkdir(parents=True, exist_ok=True)
    
    # Determine input frame based on noise setting
    noise_suffix = "with_noise" if USE_NOISY_FRAME else "without_noise"
    input_frame = f"output/frames/full_alphabet/full_alphabet_{noise_suffix}.npy"
    
    # Load frame
    print(f"Loading frame: {input_frame}")
    frame = np.load(input_frame)
    print(f"Frame shape: {frame.shape}, dtype: {frame.dtype}")
    
    # Detect blobs
    print("Detecting blobs...")
    detector = Detector()
    blobs = detect_all_blobs(frame, detector)
    
    # Verify blob count
    if len(blobs) != 27:
        print(f"Error: Expected 27 blobs, but found {len(blobs)}")
        return
    
    # Sort blobs by position
    print("Sorting blobs by position...")
    sorted_blobs = sort_blobs_by_position(blobs)
    
    # Print blob positions for debugging
    print("\nBlob positions:")
    for i, blob in enumerate(sorted_blobs):
        if i < 26:
            letter = chr(ord('A') + i)
        else:
            letter = '*'
        center_x = (blob.min_x + blob.max_x) // 2
        center_y = (blob.min_y + blob.max_y) // 2
        print(f"  {letter}: x={center_x}, y={center_y}")
    
    # Create letter to prefix sum mapping
    print("\nCreating letter to prefix sum mapping...")
    letter_map = {}
    for i, blob in enumerate(sorted_blobs):
        if i < 26:
            letter = chr(ord('A') + i)
        else:
            letter = '*'
        letter_map[letter] = int(blob.prefix_sum)
        print(f"  {letter}: {letter_map[letter]}")
    
    # Save calibration data
    output_path = output_dir / f"calibration_data_{noise_suffix}.json"
    with open(output_path, 'w') as f:
        json.dump(letter_map, f, indent=4)
    
    print(f"\nCalibration data saved to: {output_path}")
    
    # Visualize results
    visualize_path = output_dir / f"calibration_visualization_{noise_suffix}.png"
    visualize_calibration(frame, sorted_blobs, letter_map, str(visualize_path))

if __name__ == "__main__":
    main() 