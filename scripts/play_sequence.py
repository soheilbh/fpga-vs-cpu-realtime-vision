import numpy as np
import time
import csv
from pathlib import Path
import argparse
from tqdm import tqdm
import sys

# Add src directory to Python path for imports
sys.path.append(str(Path(__file__).parent.parent / 'src'))

# Import configuration
from settings.config import FRAME_WIDTH, FRAME_HEIGHT, TARGET_FPS, VIDEO_DURATION

# Import detector and recognizer
from detection.detector import Detector, BlobOutput
from recognition.recognizer import Recognizer

def parse_arguments():
    """Parse command line arguments."""
    parser = argparse.ArgumentParser(description='Play back sequences from input.txt and log recognition results.')
    parser.add_argument('--input-file', 
                       default='input/input.txt',
                       help='Path to input file containing sequence names (default: input/input.txt)')
    parser.add_argument('--output-dir', 
                       default='output/logs',
                       help='Output directory for log files (default: output/logs)')
    return parser.parse_args()

def read_sequences(input_file):
    """Read sequence names from input file."""
    with open(input_file, 'r') as f:
        sequences = [line.strip().replace(' ', '_') for line in f if line.strip()]
    return sequences

def calculate_expected_duration(num_frames, fps=TARGET_FPS):
    """Calculate expected duration in seconds."""
    return num_frames / fps

def play_sequence(sequence_name, output_dir='output/logs'):
    """Play back sequence and log recognition results."""
    # Build paths
    sequence_path = Path('output/sequence') / f'sequence_{sequence_name}.npy'
    labels_path = Path('output/sequence') / f'sequence_labels_{sequence_name}.npy'
    
    # Load sequence
    print(f"\nProcessing sequence: {sequence_name}")
    print(f"Loading sequence from {sequence_path}...")
    try:
        sequence = np.memmap(sequence_path, dtype='uint8', mode='r', shape=(TARGET_FPS * VIDEO_DURATION, FRAME_HEIGHT, FRAME_WIDTH))
        num_frames = len(sequence)
        print(f"Successfully loaded sequence with shape: {sequence.shape}")
    except Exception as e:
        print(f"Error loading sequence: {e}")
        print("Failed to load sequence file.")
        raise
    
    # Load labels if provided
    labels = None
    if labels_path.exists():
        print(f"Loading labels from {labels_path}...")
        labels = np.load(labels_path)
    
    # Initialize detector and recognizer
    detector = Detector()
    recognizer = Recognizer()
    
    # Calculate expected duration
    duration = calculate_expected_duration(num_frames)
    print(f"\nSequence Info:")
    print(f"Number of frames: {num_frames}")
    print(f"Expected duration: {duration:.2f} seconds")
    print(f"Frame rate: {TARGET_FPS} FPS")
    print(f"Frame shape: {sequence[0].shape}")
    print("\nStarting playback...")
    
    # Create output directory
    output_dir = Path(output_dir)
    output_dir.mkdir(parents=True, exist_ok=True)
    
    # Create sequence-specific log file
    log_path = output_dir / f'sequence_log_{sequence_name}.csv'
    with open(log_path, 'w', newline='') as f:
        writer = csv.writer(f)
        writer.writerow([
            'frame_index', 
            'recognized_character', 
            'prefix_sum',
            'detection_time_ms',
            'recognition_time_ms',
            'total_frame_time_ms'
        ])
        
        # Process each frame
        start_time = time.time()
        for i in tqdm(range(num_frames), desc="Processing frames"):
            frame_start_time = time.time()
            frame_np = np.array(sequence[i], copy=True)  # Make a copy to ensure we have a contiguous array
            frame = [[int(pixel) for pixel in row] for row in frame_np]  # Convert to list of lists of ints
            
            # Detect blob and measure time
            detection_start = time.time()
            blob = detector.detect(frame)
            detection_time = (time.time() - detection_start) * 1000  # Convert to ms
            
            # Recognize character and measure time
            recognition_start = time.time()
            if blob.prefix_sum > 0:
                character = recognizer.recognize([{'final_prefix_sum': blob.prefix_sum}])
            else:
                character = '_'  # No blob detected
            recognition_time = (time.time() - recognition_start) * 1000  # Convert to ms
            
            # Calculate total frame processing time
            total_frame_time = (time.time() - frame_start_time) * 1000  # Convert to ms
            
            # Log results
            writer.writerow([
                i, 
                character, 
                blob.prefix_sum,
                round(detection_time, 3),
                round(recognition_time, 3),
                round(total_frame_time, 3)
            ])
            
            # Calculate time to sleep to maintain 32 FPS
            elapsed = time.time() - start_time
            target_time = i / 32.0
            sleep_time = max(0, target_time - elapsed)
            time.sleep(sleep_time)
    
    # Calculate final statistics
    total_duration = time.time() - start_time
    actual_fps = num_frames / total_duration
    
    print(f"\nPlayback complete!")
    print(f"Log saved to: {log_path}")
    print(f"\nPerformance Summary:")
    print(f"Total playback duration: {total_duration:.2f} seconds")
    print(f"Average FPS: {actual_fps:.2f}")
    
    # Post-processing: Extract and print the final recognized string
    print("\nRecognition Results:")
    recognized_chars = []
    with open(log_path, 'r') as f:
        reader = csv.DictReader(f)
        for row in reader:
            char = row['recognized_character']
            if char != '_':
                recognized_chars.append(char)
    
    final_string = ''.join(recognized_chars)
    print(f"Final recognized string: {final_string}")
    print(f"Total recognized characters: {len(recognized_chars)}")

def main():
    # Parse arguments
    args = parse_arguments()
    
    try:
        # Read sequences from input file
        sequences = read_sequences(args.input_file)
        print(f"Found {len(sequences)} sequences to process")
        
        # Process each sequence
        for sequence_name in sequences:
            play_sequence(
                sequence_name=sequence_name,
                output_dir=args.output_dir
            )
            
    except Exception as e:
        print(f"Error: {e}")
        return 1
    
    return 0

if __name__ == "__main__":
    exit(main()) 