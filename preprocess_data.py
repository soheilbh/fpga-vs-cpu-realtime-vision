#!/usr/bin/env python3

import os
import subprocess

def run_script(script_name):
    """Run a Python script."""
    print(f"Running {script_name}...")
    subprocess.run(['python3', script_name], check=True)
    print(f"Completed {script_name}")

def main():
    # Step 1: Generate full alphabet frames
    run_script('scripts/generate_full_alphabet_frames.py')

    # Step 2: Calibrate letters
    run_script('scripts/calibrate_letters.py')

    # Step 3: Find batch combinations
    run_script('scripts/batch_combination_finder.py')

    print("Preprocessing completed successfully!")

if __name__ == "__main__":
    main() 