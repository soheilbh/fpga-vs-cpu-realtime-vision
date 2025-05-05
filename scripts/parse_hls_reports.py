#!/usr/bin/env python3

import os
import re
import csv
from datetime import datetime
from pathlib import Path

def parse_timing_report(report_path):
    """Parse timing report to extract clock period and latency information."""
    with open(report_path, 'r') as f:
        content = f.read()
    
    # Extract clock period (assuming 10ns clock period based on the report)
    clock_period = 10.0
    
    # Extract latency information for the main module
    latency_match = re.search(r'\|\+ detect_and_recognize\s+\|\s+-\|\s+([\d.]+)\|\s+-\|\s+-\|\s+-\|\s+-\|\s+no\|\s+(\d+)\s+\(~?\d+%\)\|\s+(\d+)\s+\(\d+%\)\|\s+(\d+)\s+\(\d+%\)\|\s+(\d+)\s+\(\d+%\)\|', content)
    if latency_match:
        slack = float(latency_match.group(1))
        bram = int(latency_match.group(2))
        dsp = int(latency_match.group(3))
        ff = int(latency_match.group(4))
        lut = int(latency_match.group(5))
    else:
        slack = 0.0
        bram = dsp = ff = lut = 0
    
    # Extract II from the main loop
    ii_match = re.search(r'\|   o VITIS_LOOP_147_2\s+\|\s+II\|\s+[\d.]+\|\s+(\d+)\|\s+[\d.e+]+\|\s+(\d+)\|\s+\d+\|\s+\d+\|\s+yes\|', content)
    if ii_match:
        min_latency = int(ii_match.group(1))
        ii = int(ii_match.group(2))
        max_latency = min_latency  # Since it's a fixed latency
        avg_latency = min_latency
    else:
        ii = min_latency = max_latency = avg_latency = 0
    
    return {
        'clock_period': clock_period,
        'min_latency': min_latency,
        'max_latency': max_latency,
        'avg_latency': avg_latency,
        'ii': ii,
        'slack': slack,
        'LUT': lut,
        'FF': ff,
        'BRAM': bram,
        'DSP': dsp
    }

def parse_utilization_report(report_path):
    """Parse utilization report to extract resource usage."""
    # We don't need this function anymore as we're getting resource info from timing report
    return {
        'LUT': 0,
        'FF': 0,
        'BRAM': 0,
        'DSP': 0
    }

def process_solution(solution_dir):
    """Process a single solution directory and extract synthesis information."""
    solution_name = os.path.basename(solution_dir)
    report_dir = os.path.join(solution_dir, 'syn', 'report')
    
    if not os.path.exists(report_dir):
        print(f"Warning: Report directory not found for {solution_name}")
        return None
    
    # Find report files
    timing_report = None
    utilization_report = None
    
    for file in os.listdir(report_dir):
        if file.endswith('_csynth.rpt'):
            timing_report = os.path.join(report_dir, file)
        elif file.endswith('_utilization.rpt'):
            utilization_report = os.path.join(report_dir, file)
    
    if not timing_report or not utilization_report:
        print(f"Warning: Missing report files for {solution_name}")
        return None
    
    # Parse reports
    timing_info = parse_timing_report(timing_report)
    resource_info = parse_utilization_report(utilization_report)
    
    # Get synthesis timestamp from report file
    timestamp = datetime.fromtimestamp(os.path.getmtime(timing_report))
    
    return {
        'module_name': solution_name,
        'clock_period': timing_info['clock_period'],
        'min_latency': timing_info['min_latency'],
        'max_latency': timing_info['max_latency'],
        'avg_latency': timing_info['avg_latency'],
        'ii': timing_info['ii'],
        'LUTs': resource_info['LUT'],
        'FFs': resource_info['FF'],
        'BRAMs': resource_info['BRAM'],
        'DSPs': resource_info['DSP'],
        'synthesis_date': timestamp.strftime('%Y-%m-%d %H:%M:%S')
    }

def main():
    # Create output directory if it doesn't exist
    output_dir = '../output/hls_pars_output'
    os.makedirs(output_dir, exist_ok=True)
    
    # Paths to report files
    timing_report = '../hls_syn/hls_imp_report_output/detect_and_recognize_csynth.rpt'
    
    if not os.path.exists(timing_report):
        print("Error: Required report files not found!")
        return
    
    # Parse reports
    with open(timing_report, 'r') as f:
        content = f.read()
    
    # Extract clock period (assuming 10ns clock period based on the report)
    clock_period = 10.0
    
    # Extract latency and resource information for the main module
    pattern = r'\|\+ detect_and_recognize\s+\|\s+-\|\s+[\d.]+\|\s+-\|\s+-\|\s+-\|\s+-\|\s+no\|\s+(\d+).*?\|\s+(\d+).*?\|\s+(\d+).*?\|\s+(\d+).*?\|'
    main_match = re.search(pattern, content)
    if main_match:
        bram = int(main_match.group(1))
        dsp = int(main_match.group(2))
        ff = int(main_match.group(3))
        lut = int(main_match.group(4))
    else:
        bram = dsp = ff = lut = 0
    
    # Extract II and latency from the main loop
    ii_pattern = r'\|   o VITIS_LOOP_147_2\s+\|\s+II\|\s+[\d.]+\|\s+(\d+)\|\s+[\d.e+]+\|\s+(\d+)\|\s+\d+\|\s+\d+\|\s+yes\|'
    ii_match = re.search(ii_pattern, content)
    if ii_match:
        min_latency = int(ii_match.group(1))
        ii = int(ii_match.group(2))
        max_latency = min_latency  # Since it's a fixed latency
        avg_latency = min_latency
    else:
        ii = min_latency = max_latency = avg_latency = 0
    
    # Create result dictionary
    result = {
        'module_name': 'detect_and_recognize',
        'clock_period': clock_period,
        'min_latency': min_latency,
        'max_latency': max_latency,
        'avg_latency': avg_latency,
        'ii': ii,
        'LUTs': lut,
        'FFs': ff,
        'BRAMs': bram,
        'DSPs': dsp,
        'synthesis_date': datetime.fromtimestamp(os.path.getmtime(timing_report)).strftime('%Y-%m-%d %H:%M:%S')
    }
    
    # Write result to CSV
    csv_path = os.path.join(output_dir, 'hls_synthesis_log.csv')
    fieldnames = [
        'module_name', 'clock_period', 'min_latency', 'max_latency',
        'avg_latency', 'ii', 'LUTs', 'FFs', 'BRAMs', 'DSPs',
        'synthesis_date'
    ]
    
    with open(csv_path, 'w', newline='') as f:
        writer = csv.DictWriter(f, fieldnames=fieldnames)
        writer.writeheader()
        writer.writerow(result)
    
    print(f"Synthesis summary saved to {csv_path}")

if __name__ == "__main__":
    main() 