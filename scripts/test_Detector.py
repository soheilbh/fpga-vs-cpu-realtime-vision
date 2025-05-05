"""
Test script to verify the Detector class functionality.
"""

import sys
import os
import numpy as np
import cv2
from datetime import datetime
import glob
from pathlib import Path

# Add src directory to Python path for imports
sys.path.append(str(Path(__file__).parent.parent / 'src'))

from detection.detector import Detector, BlobOutput

# Configuration
USE_BATCH_FRAME = True # Set to True to use batch frames, False to use normal frames

def visualize_detection(frame: np.ndarray, blob: BlobOutput, save_path: str = None):
    """
    Visualize the detected blob on the frame.
    
    Args:
        frame (np.ndarray): Original frame
        blob (BlobOutput): Detected blob
        save_path (str, optional): Path to save the visualization
    """
    # Create a copy of the frame for visualization
    vis_frame = frame.copy()
    
    # Draw bounding box
    cv2.rectangle(vis_frame,
                 (blob.min_x, blob.min_y),
                 (blob.max_x, blob.max_y),
                 color=255,
                 thickness=2)
    
    # Draw prefix sum
    cv2.putText(vis_frame,
               f"Sum:{blob.prefix_sum}",
               (blob.min_x, blob.min_y - 10),
               cv2.FONT_HERSHEY_SIMPLEX,
               0.5,
               255,
               2)
    
    # Display or save the visualization
    if save_path:
        cv2.imwrite(save_path, vis_frame)
        print(f"Visualization saved to: {save_path}")
    
    cv2.imshow('Detection Results', vis_frame)
    cv2.waitKey(0)
    cv2.destroyAllWindows()

def main():
    # Create output directory
    output_dir = "output/detection"
    os.makedirs(output_dir, exist_ok=True)
    
    # Select frame directory and pattern based on configuration
    if USE_BATCH_FRAME:
        frame_dir = "output/batches"
        frame_pattern = "batch_*.npy"
    else:
        frame_dir = "output/frames"
        frame_pattern = "frame_*.npy"
    
    print(f"\nUsing frames from: {frame_dir}")
    
    # Find the most recent frame file
    frame_files = glob.glob(os.path.join(frame_dir, frame_pattern))
    if not frame_files:
        print(f"No saved frames found in {frame_dir} directory")
        return
    
    latest_frame_file = max(frame_files)
    print(f"\nReading frame from: {latest_frame_file}")
    
    # Read the frame
    frame = np.load(latest_frame_file)
    
    # Print frame statistics
    print("\nFrame Statistics:")
    print(f"Shape: {frame.shape}")
    print(f"Data type: {frame.dtype}")
    print(f"Min value: {frame.min()}")
    print(f"Max value: {frame.max()}")
    print(f"Mean value: {frame.mean():.2f}")
    
    # Initialize detector
    detector = Detector()
    
    # Detect blob
    blob = detector.detect(frame)
    
    # Print detection results
    print(f"\nDetection Results:")
    if blob.prefix_sum > 0:
        print(f"Blob detected:")
        print(f"  Prefix Sum: {blob.prefix_sum}")
        print(f"  Bounding Box: x={blob.min_x}, y={blob.min_y}, "
              f"width={blob.max_x - blob.min_x + 1}, height={blob.max_y - blob.min_y + 1}")
    else:
        print("No blob detected")
    
    # Generate timestamp for filenames
    timestamp = datetime.now().strftime("%Y%m%d_%H%M%S")
    
    # Visualize and save detection results
    vis_path = os.path.join(output_dir, f"detection_{timestamp}.png")
    visualize_detection(frame, blob, vis_path)

if __name__ == "__main__":
    main() 