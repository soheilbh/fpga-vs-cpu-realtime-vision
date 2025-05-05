import os
import csv
import argparse
import numpy as np
from pathlib import Path
import psutil
import gc
import sys
import json

# Add src directory to Python path for imports
sys.path.append(str(Path(__file__).parent.parent / 'src'))
from settings.config import FRAME_WIDTH, FRAME_HEIGHT, TARGET_FPS, VIDEO_DURATION

def parse_arguments():
    """Parse command line arguments."""
    parser = argparse.ArgumentParser(description='Build sequence dataset from manifest and frame files.')
    parser.add_argument('--output-dir', 
                       default='output/sequence',
                       help='Output directory for sequence files (default: output/sequence)')
    parser.add_argument('--batch-dir', 
                       default=None,
                       help='Directory containing batch files (default: output/batches/{input_string})')
    return parser.parse_args()

def get_paths(input_string, output_dir, batch_dir=None):
    """Build and validate all required paths."""
    # Convert input string to folder name format
    folder_name = input_string.replace(' ', '_')
    
    # Set default batch directory if not provided
    if batch_dir is None:
        batch_dir = Path('output/batches') / folder_name
    else:
        batch_dir = Path(batch_dir)
    
    # Build output directory path
    output_dir = Path(output_dir)
    
    # Build file paths
    manifest_path = batch_dir / 'manifest.csv'
    sequence_path = output_dir / f'sequence_{folder_name}.npy'
    labels_path = output_dir / f'sequence_labels_{folder_name}.npy'
    
    # Validate paths
    if not batch_dir.exists():
        raise FileNotFoundError(f"Batch directory not found: {batch_dir}")
    if not manifest_path.exists():
        raise FileNotFoundError(f"Manifest file not found: {manifest_path}")
    
    return {
        'batch_dir': batch_dir,
        'manifest_path': manifest_path,
        'sequence_path': sequence_path,
        'labels_path': labels_path
    }

def read_manifest(manifest_path):
    """Read and sort manifest file."""
    frames_data = []
    with open(manifest_path, 'r') as f:
        reader = csv.DictReader(f)
        for row in reader:
            frames_data.append({
                'index': int(row['frame_index']),
                'filename': row['filename'],
                'character': row['character']
            })
    
    # Sort by frame_index
    frames_data.sort(key=lambda x: x['index'])
    return frames_data

def build_sequence(frames_data, batch_dir, sequence_path, labels_path, batch_size=100):
    """Build sequence dataset from manifest data with memory-efficient batch processing."""
    # Initialize lists for labels
    labels = []
    
    # Process frames in batches
    total_frames = len(frames_data)
    print(f"\nProcessing {total_frames} frames in batches of {batch_size}...")
    
    # Create memory-mapped array for sequence
    first_frame = np.load(batch_dir / frames_data[0]['filename'])
    sequence_shape = (total_frames,) + first_frame.shape
    sequence = np.memmap(sequence_path, dtype=first_frame.dtype, mode='w+', shape=sequence_shape)
    
    for i in range(0, total_frames, batch_size):
        batch_end = min(i + batch_size, total_frames)
        batch_frames = []
        
        # Process current batch
        for j in range(i, batch_end):
            frame_data = frames_data[j]
            frame_path = batch_dir / frame_data['filename']
            if not frame_path.exists():
                raise FileNotFoundError(f"Frame file not found: {frame_path}")
            
            frame = np.load(frame_path)
            batch_frames.append(frame)
            labels.append(frame_data['character'])
        
        # Save batch to memory-mapped array
        sequence[i:batch_end] = np.stack(batch_frames)
        
        # Clear memory
        del batch_frames
        gc.collect()
        
        # Print progress and memory usage
        process = psutil.Process()
        memory_usage = process.memory_info().rss / 1024 / 1024  # MB
        print(f"Processed {batch_end}/{total_frames} frames | Memory usage: {memory_usage:.2f} MB")
    
    # Save labels
    labels_array = np.array(labels)
    np.save(labels_path, labels_array)
    
    # Flush memory-mapped array to disk
    sequence.flush()
    del sequence
    
    return sequence_shape, labels_array

def print_summary(input_string, total_frames, sequence_shape, labels_shape, output_paths):
    """Print final summary of the process."""
    process = psutil.Process()
    memory_usage = process.memory_info().rss / 1024 / 1024  # MB
    
    print("\n" + "="*50)
    print("Sequence Build Summary")
    print("="*50)
    print(f"Input string: {input_string}")
    print(f"Total frames processed: {total_frames}")
    print(f"Sequence shape: {sequence_shape}")
    print(f"Labels shape: {labels_shape}")
    print(f"Final memory usage: {memory_usage:.2f} MB")
    print("\nOutput files:")
    print(f"Sequence: {output_paths['sequence_path']}")
    print(f"Labels: {output_paths['labels_path']}")
    print("="*50)

def read_input_string():
    """Read input string from input.txt."""
    try:
        with open('input/input.txt', 'r') as f:
            input_string = f.read().strip()
            # Keep original input for folder name
            folder_name = input_string.replace(' ', '_')
            return input_string, folder_name
    except FileNotFoundError:
        print("Error: input.txt file not found")
        sys.exit(1)
    except Exception as e:
        print(f"Error reading input.txt: {e}")
        sys.exit(1)

def main():
    # Read input string from file
    input_string, folder_name = read_input_string()
    
    # Parse command line arguments
    args = parse_arguments()
    
    try:
        # Get and validate paths
        paths = get_paths(input_string, args.output_dir, args.batch_dir)
        
        # Create output directory
        paths['sequence_path'].parent.mkdir(parents=True, exist_ok=True)
        
        # Read manifest
        frames_data = read_manifest(paths['manifest_path'])
        
        # Build sequence with smaller batch size
        sequence_shape, labels = build_sequence(
            frames_data, 
            paths['batch_dir'],
            paths['sequence_path'],
            paths['labels_path'],
            batch_size=20  # Reduced batch size for better memory management
        )
        
        # Print summary
        print_summary(
            input_string,
            len(frames_data),
            sequence_shape,
            labels.shape,
            paths
        )
        
    except Exception as e:
        print(f"\nError: {e}")
        return 1
    
    return 0

if __name__ == "__main__":
    exit(main()) 