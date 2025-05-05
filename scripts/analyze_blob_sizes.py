import numpy as np
import sys
from pathlib import Path

# Add src directory to Python path for imports
sys.path.append(str(Path(__file__).parent.parent / 'src'))

from detection.detector import Detector

def analyze_blob_sizes():
    # Load the frame
    frame = np.load('output/frames/full_alphabet/full_alphabet_with_noise.npy')
    
    # Initialize detector
    detector = Detector()
    
    # Create a copy of the frame to mark visited pixels
    visited = np.zeros_like(frame, dtype=bool)
    blobs = []
    
    # Scan the frame for blobs
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
    
    # Sort blobs by x position (left to right)
    blobs.sort(key=lambda b: b.min_x)
    
    # Print header
    print("\nCharacter Analysis:")
    print("-" * 50)
    print(f"{'Char':<5} {'Size':<10} {'Dimensions':<15} {'Prefix Sum':<12} {'Bounds'}")
    print("-" * 50)
    
    # Analyze each blob
    for i, blob in enumerate(blobs):
        width = blob.max_x - blob.min_x + 1
        height = blob.max_y - blob.min_y + 1
        size = width * height
        
        # Get character based on position (assuming standard alphabet order)
        char = chr(ord('A') + i) if i < 26 else '*'
        
        print(f"{char:<5} {size:<10} {width}x{height:<10} {blob.prefix_sum:<12} x({blob.min_x}, {blob.max_x}), y({blob.min_y}, {blob.max_y})")
    
    # Print summary
    print("\nSummary:")
    print(f"Total blobs found: {len(blobs)}")
    print(f"Maximum blob size: {max(b.prefix_sum for b in blobs)}")
    print(f"Maximum dimensions: {max((b.max_x - b.min_x + 1) * (b.max_y - b.min_y + 1) for b in blobs)}")

if __name__ == "__main__":
    analyze_blob_sizes() 