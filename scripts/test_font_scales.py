"""
Test different font scales to find optimal scale for unique prefix sums.
"""

import os
import sys
import json
import numpy as np
from pathlib import Path
import subprocess

def modify_config(font_scale: float):
    """Modify the config.py file with new font scale."""
    config_path = "../src/settings/config.py"
    with open(config_path, 'r') as f:
        lines = f.readlines()
    
    # Find and modify the font scale line
    for i, line in enumerate(lines):
        if "LETTER_FONT_SCALE" in line:
            lines[i] = f"LETTER_FONT_SCALE = {font_scale}  # Base font scale for letters\n"
            break
    
    # Write back the modified config
    with open(config_path, 'w') as f:
        f.writelines(lines)

def run_command(command: str):
    """Run a shell command and return its output."""
    try:
        result = subprocess.run(command, shell=True, check=True, 
                              stdout=subprocess.PIPE, stderr=subprocess.PIPE,
                              text=True)
        return result.stdout
    except subprocess.CalledProcessError as e:
        print(f"Error running command '{command}': {e}")
        print(f"Error output: {e.stderr}")
        return None

def check_unique_sums(calibration_file: str) -> bool:
    """Check if all prefix sums in the calibration file are unique."""
    with open(calibration_file, 'r') as f:
        data = json.load(f)
    
    # Get all prefix sums
    prefix_sums = list(data.values())
    
    # Check for duplicates
    unique_sums = set(prefix_sums)
    is_unique = len(prefix_sums) == len(unique_sums)
    
    if not is_unique:
        # Find duplicates
        from collections import Counter
        duplicates = {k: v for k, v in Counter(prefix_sums).items() if v > 1}
        print(f"Duplicate prefix sums found: {duplicates}")
    
    return is_unique

def main():
    """Main function to test different font scales."""
    # Create output directory for results
    output_dir = Path("../output/font_scale_tests")
    output_dir.mkdir(parents=True, exist_ok=True)
    
    # Test font scales from 2.5 to 3.5 in steps of 0.1
    font_scales = np.arange(2.5, 3.6, 0.1)
    
    print("\nTesting font scales for unique prefix sums:")
    print("-" * 50)
    
    for scale in font_scales:
        print(f"\nTesting font scale: {scale:.1f}")
        
        # 1. Modify config
        modify_config(scale)
        print("  ✓ Modified config.py")
        
        # 2. Generate full alphabet frames
        print("  ✓ Running generate_full_alphabet_frames.py")
        run_command("python3 generate_full_alphabet_frames.py")
        
        # 3. Run calibration
        print("  ✓ Running calibration")
        run_command("python3 calibrate_letters.py")
        
        # 4. Check uniqueness
        calibration_file = "../output/calibration/calibration_data_with_noise.json"
        is_unique = check_unique_sums(calibration_file)
        
        # Save results
        result = {
            "font_scale": scale,
            "is_unique": is_unique,
            "calibration_file": calibration_file
        }
        
        result_file = output_dir / f"scale_{scale:.1f}_results.json"
        with open(result_file, 'w') as f:
            json.dump(result, f, indent=4)
        
        print(f"  ✓ Results saved to {result_file}")
        print(f"  ✓ Prefix sums are {'unique' if is_unique else 'not unique'}")
    
    print("\nTesting complete!")
    print("Check output/font_scale_tests/ for detailed results")

if __name__ == "__main__":
    main() 