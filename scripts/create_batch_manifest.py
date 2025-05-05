import os
import csv
import random
import numpy as np
from pathlib import Path
import sys

# Add src directory to Python path for imports
sys.path.append(str(Path(__file__).parent.parent / 'src'))

# Import configuration
from settings.config import TARGET_FPS, VIDEO_DURATION

# Calculate total frames based on FPS and duration
TOTAL_FRAMES = TARGET_FPS * VIDEO_DURATION

def read_input_string():
    """Read the input string from input.txt."""
    with open('input/input.txt', 'r') as f:
        return f.read().strip().upper()

def get_batch_folder_path(input_string):
    """Build the path to the batch folder based on input string."""
    folder_name = input_string.replace(' ', '_')
    return Path('output/batches') / folder_name

def get_real_frames(input_string, batch_folder):
    """Get list of real frame files in order of input string."""
    frames = []
    for i, char in enumerate(input_string):
        # For space character, use 'asterisk' in filename and character field
        filename_char = 'asterisk' if char == ' ' else char
        frame_path = batch_folder / f'batch_{filename_char}_{i}.npy'
        if frame_path.exists():
            # Use asterisk for space in character field
            display_char = '*' if char == ' ' else char
            frames.append((i, str(frame_path), display_char))
    return frames

def insert_empty_frames(real_frames, total_frames=TOTAL_FRAMES, seed=42):
    """Insert empty frames randomly among real frames."""
    random.seed(seed)
    
    # Calculate number of empty frames needed
    num_empty = total_frames - len(real_frames)
    if num_empty < 0:
        raise ValueError(f"Number of real frames ({len(real_frames)}) exceeds total frames ({total_frames})")
    
    # Create list of all positions
    positions = list(range(total_frames))
    
    # Reserve positions for real frames first (roughly evenly spaced)
    spacing = total_frames // len(real_frames)
    real_positions = [i * spacing for i in range(len(real_frames))]
    
    # Remove reserved positions from available positions
    for pos in real_positions:
        positions.remove(pos)
    
    # Randomly select positions for empty frames from remaining positions
    empty_positions = sorted(random.sample(positions, num_empty))
    
    # Create final list with frames in correct positions
    result = [(i, 'empty_batch.npy', '_') for i in range(total_frames)]  # Initialize with empty frames
    
    # Insert real frames at their reserved positions
    for real_idx, pos in enumerate(real_positions):
        result[pos] = (pos, real_frames[real_idx][1], real_frames[real_idx][2])
    
    return result

def create_manifest(frames, batch_folder):
    """Create manifest.csv file with frame information."""
    manifest_path = batch_folder / 'manifest.csv'
    with open(manifest_path, 'w', newline='') as f:
        writer = csv.writer(f)
        writer.writerow(['frame_index', 'filename', 'character'])
        for frame in frames:
            # For empty frames, use just the filename
            if frame[1] == 'empty_batch.npy':
                writer.writerow([frame[0], frame[1], frame[2]])
            else:
                # For real frames, use just the filename since they're in the same directory
                filename = os.path.basename(frame[1])
                writer.writerow([frame[0], filename, frame[2]])
    return manifest_path

def main():
    # Read input string
    input_string = read_input_string()
    print(f"Processing input string: {input_string}")
    
    # Get batch folder path
    batch_folder = get_batch_folder_path(input_string)
    print(f"Batch folder: {batch_folder}")
    
    # Get real frames
    real_frames = get_real_frames(input_string, batch_folder)
    print(f"Found {len(real_frames)} real frames")
    
    # Insert empty frames
    try:
        all_frames = insert_empty_frames(real_frames)
        print(f"Created sequence of {len(all_frames)} frames ({len(real_frames)} real + {len(all_frames) - len(real_frames)} empty)")
    except ValueError as e:
        print(f"Error: {e}")
        return
    
    # Create manifest
    manifest_path = create_manifest(all_frames, batch_folder)
    print(f"Created manifest file: {manifest_path}")

if __name__ == "__main__":
    main() 