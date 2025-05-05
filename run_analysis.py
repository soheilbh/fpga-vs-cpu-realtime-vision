#!/usr/bin/env python3

import subprocess
import os

def run_script(script_name):
    """Run a Python script."""
    print(f"Running {script_name}...")
    subprocess.run(['python3', f'scripts/{script_name}'], check=True)
    print(f"Completed {script_name}")

def main():
    # Step 1: Generate batch frame
    run_script('generate_batch_frame.py')

    # Step 2: Create batch manifest
    run_script('create_batch_manifest.py')

    # Step 3: Build sequence
    run_script('build_sequence.py')

    # Step 4: Play sequence
    run_script('play_sequence.py')

    print("Analysis completed successfully!")

if __name__ == "__main__":
    main() 