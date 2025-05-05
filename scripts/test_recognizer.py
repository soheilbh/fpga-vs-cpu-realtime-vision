"""
Test script for the Recognizer class.

This script:
1. Loads the latest frame from output/frames/
2. Uses Detector to find blobs
3. Uses Recognizer to recognize a character
4. Visualizes and saves the results
"""

import os
import sys
import numpy as np
import matplotlib.pyplot as plt
from pathlib import Path
from datetime import datetime

# Add src directory to Python path for imports
sys.path.append(str(Path(__file__).parent.parent / 'src'))

from detection.detector import Detector, BlobOutput
from recognition.recognizer import Recognizer

# Configuration
USE_BATCH_FRAME = True  # Set to True to use batch frames, False to use normal frames

def visualize_results(frame: np.ndarray, blob: BlobOutput, char: str, save_path: str = None):
    """
    Visualize the detection and recognition results.
    
    Args:
        frame (np.ndarray): Original frame
        blob (BlobOutput): Detected blob
        char (str): Recognized character
        save_path (str, optional): Path to save the visualization
    """
    plt.figure(figsize=(12, 6))
    
    # Original frame with detected blob
    plt.subplot(1, 2, 1)
    plt.imshow(frame, cmap='gray')
    
    # Draw bounding box
    plt.plot([blob.min_x, blob.max_x, blob.max_x, blob.min_x, blob.min_x],
             [blob.min_y, blob.min_y, blob.max_y, blob.max_y, blob.min_y],
             'r-', linewidth=2)
    
    # Add prefix sum
    plt.text(blob.min_x, blob.min_y - 10, 
            f"Sum:{blob.prefix_sum}",
            color='yellow', ha='left', va='bottom')
    
    plt.title('Detected Blob')
    
    # Text showing recognized character
    plt.subplot(1, 2, 2)
    plt.text(0.5, 0.5, f'Recognized: {char}', 
             fontsize=24, ha='center', va='center')
    plt.axis('off')
    plt.title('Recognition Result')
    
    plt.tight_layout()
    
    if save_path:
        plt.savefig(save_path)
        print(f"Visualization saved to: {save_path}")
    
    plt.show()

def main():
    # Create output directory
    output_dir = Path("output/recognition")
    output_dir.mkdir(parents=True, exist_ok=True)
    
    # Initialize detector and recognizer (with verbose mode for testing)
    detector = Detector()
    recognizer = Recognizer(verbose=True)
    
    # Select frame directory and pattern based on configuration
    if USE_BATCH_FRAME:
        frames_dir = Path("output/batches")
        frame_pattern = "batch_*.npy"
    else:
        frames_dir = Path("output/frames")
        frame_pattern = "frame_*.npy"
    
    print(f"\nUsing frames from: {frames_dir}")
    
    # Get the latest .npy frame
    npy_files = list(frames_dir.glob(frame_pattern))
    if not npy_files:
        print(f"No .npy frame files found in {frames_dir}/")
        return
    
    # Use the first file found
    frame_file = npy_files[0]
    print(f"Loading frame: {frame_file}")
    frame = np.load(frame_file)
    print(f"Frame shape: {frame.shape}, dtype: {frame.dtype}, min: {frame.min()}, max: {frame.max()}")
    
    # Detect blob
    blob = detector.detect(frame)
    print(f"\nDetection Results:")
    if blob.prefix_sum > 0:
        print(f"Blob detected:")
        print(f"  Prefix Sum: {blob.prefix_sum}")
        print(f"  Bounding Box: x={blob.min_x}, y={blob.min_y}, "
              f"width={blob.max_x - blob.min_x + 1}, height={blob.max_y - blob.min_y + 1}")
    else:
        print("No blob detected")
        return
    
    # Recognize character
    char = recognizer.recognize([{'final_prefix_sum': blob.prefix_sum}])
    
    # Generate timestamp for filename
    timestamp = datetime.now().strftime("%Y%m%d_%H%M%S")
    
    # Visualize and save results
    vis_path = output_dir / f"recognition_{timestamp}.png"
    visualize_results(frame, blob, char, str(vis_path))
    
    print(f"\nRecognized character: {char}")

    # Test with verbose=False to demonstrate silent operation
    silent_recognizer = Recognizer(verbose=False)
    silent_char = silent_recognizer.recognize([{'final_prefix_sum': blob.prefix_sum}])
    print("\nSilent recognition test:")
    print(f"Recognized character: {silent_char}")

if __name__ == "__main__":
    main() 