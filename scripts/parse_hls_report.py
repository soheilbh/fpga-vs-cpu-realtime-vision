#!/usr/bin/env python3

import os
import re
from datetime import datetime
import csv

def parse_report(report_path):
    """Parse HLS synthesis report and extract comprehensive timing and resource information."""
    # Read the file line by line and look for specific patterns
    module_info = None
    loop_info = None
    hw_interfaces = {}
    sw_io = {}
    storage_info = {}
    operations_info = []
    performance_info = {}
    power_info = {}
    
    with open(report_path, 'r') as f:
        current_section = None
        for line in f:
            # Check for section headers
            if '== Synthesis Summary Report' in line:
                current_section = 'summary'
            elif '== HW Interfaces' in line:
                current_section = 'hw_interfaces'
            elif '== SW I/O Information' in line:
                current_section = 'sw_io'
            elif '== Storage Report' in line:
                current_section = 'storage'
            elif '== Bind Op Report' in line:
                current_section = 'operations'
            elif 'Performance Estimates' in line:
                current_section = 'performance'
            elif 'Power Estimates' in line:
                current_section = 'power'
            
            # Parse based on current section
            if current_section == 'summary':
                if '|+ detect_and_recognize' in line:
                    parts = [p.strip() for p in line.strip().split('|')]
                    if len(parts) >= 13:
                        try:
                            slack = float(parts[3]) if parts[3] != '-' else 0.0
                            bram = int(parts[10].split()[0])
                            dsp = int(parts[11].split()[0])
                            ff = int(parts[12].split()[0])
                            lut = int(parts[13].split()[0])
                            module_info = (slack, bram, dsp, ff, lut)
                            print(f"Found module info: {module_info}")
                        except (ValueError, IndexError) as e:
                            print(f"Error parsing module info: {e}")
                            continue
                
                if '|   o VITIS_LOOP_147_2' in line:
                    parts = [p.strip() for p in line.strip().split('|')]
                    if len(parts) >= 9:
                        try:
                            latency = int(parts[4])
                            ii = int(parts[7])
                            trip_count = int(parts[8])
                            loop_info = (latency, ii, trip_count)
                            print(f"Found loop info: {loop_info}")
                        except (ValueError, IndexError) as e:
                            print(f"Error parsing loop info: {e}")
                            continue
            
            elif current_section == 'hw_interfaces':
                if '| s_axi_control' in line:
                    parts = [p.strip() for p in line.strip().split('|')]
                    if len(parts) >= 5:
                        hw_interfaces['s_axi_control'] = {
                            'data_width': parts[2],
                            'address_width': parts[3],
                            'offset': parts[4]
                        }
            
            elif current_section == 'sw_io':
                if '| frame' in line or '| result' in line:
                    parts = [p.strip() for p in line.strip().split('|')]
                    if len(parts) >= 3:
                        sw_io[parts[1]] = {
                            'direction': parts[2],
                            'datatype': parts[3] if len(parts) > 3 else 'N/A'
                        }
            
            elif current_section == 'storage':
                if '|+ detect_and_recognize' in line:
                    parts = [p.strip() for p in line.strip().split('|')]
                    if len(parts) >= 3:
                        storage_info['detect_and_recognize'] = {
                            'bram': parts[3] if len(parts) > 3 else '0',
                            'uram': parts[4] if len(parts) > 4 else '0'
                        }
            
            elif current_section == 'operations':
                if '|' in line and not line.startswith('+') and not line.startswith('| Name'):
                    parts = [p.strip() for p in line.strip().split('|')]
                    if len(parts) >= 7:
                        op_info = {
                            'name': parts[1],
                            'dsp': parts[2],
                            'pragma': parts[3],
                            'variable': parts[4],
                            'operation': parts[5],
                            'implementation': parts[6],
                            'latency': parts[7] if len(parts) > 7 else '0'
                        }
                        operations_info.append(op_info)
            
            elif current_section == 'performance':
                if 'Target' in line:
                    parts = line.split(':')
                    if len(parts) == 2:
                        performance_info['target'] = parts[1].strip()
                elif 'Estimated' in line:
                    parts = line.split(':')
                    if len(parts) == 2:
                        performance_info['estimated'] = parts[1].strip()
                elif 'Achieved' in line:
                    parts = line.split(':')
                    if len(parts) == 2:
                        performance_info['achieved'] = parts[1].strip()
            
            elif current_section == 'power':
                if 'Dynamic' in line:
                    parts = line.split(':')
                    if len(parts) == 2:
                        power_info['dynamic'] = parts[1].strip()
                elif 'Static' in line:
                    parts = line.split(':')
                    if len(parts) == 2:
                        power_info['static'] = parts[1].strip()
                elif 'Total' in line:
                    parts = line.split(':')
                    if len(parts) == 2:
                        power_info['total'] = parts[1].strip()
    
    if not module_info:
        print("Error: Could not find module information in report")
        return None
    
    if not loop_info:
        print("Error: Could not find loop information in report")
        return None
    
    # Unpack the tuples
    slack, bram, dsp, ff, lut = module_info
    latency, ii, trip_count = loop_info
    
    # Calculate performance metrics
    clock_period = 10.0  # ns
    total_latency_ns = latency * clock_period
    throughput = 1.0 / (ii * clock_period)  # operations per ns
    
    result = {
        'module_name': 'detect_and_recognize',
        'clock_period': clock_period,
        'slack': slack,
        'min_latency': latency,
        'max_latency': latency,
        'avg_latency': latency,
        'total_latency_ns': total_latency_ns,
        'ii': ii,
        'trip_count': trip_count,
        'throughput_ops_per_ns': throughput,
        'LUTs': lut,
        'FFs': ff,
        'BRAMs': bram,
        'DSPs': dsp
    }
    
    # Add HW interface info
    if hw_interfaces:
        result.update({
            's_axi_control_data_width': hw_interfaces.get('s_axi_control', {}).get('data_width', 'N/A'),
            's_axi_control_address_width': hw_interfaces.get('s_axi_control', {}).get('address_width', 'N/A'),
            's_axi_control_offset': hw_interfaces.get('s_axi_control', {}).get('offset', 'N/A')
        })
    
    # Add SW I/O info
    if sw_io:
        for name, info in sw_io.items():
            result.update({
                f'sw_io_{name}_direction': info.get('direction', 'N/A'),
                f'sw_io_{name}_datatype': info.get('datatype', 'N/A')
            })
    
    # Add storage info
    if storage_info:
        result.update({
            'storage_bram': storage_info.get('detect_and_recognize', {}).get('bram', '0'),
            'storage_uram': storage_info.get('detect_and_recognize', {}).get('uram', '0')
        })
    
    # Add operations info
    if operations_info:
        # Count different types of operations
        op_counts = {}
        for op in operations_info:
            op_type = op['operation']
            op_counts[op_type] = op_counts.get(op_type, 0) + 1
        
        result.update({
            'total_operations': len(operations_info),
            'add_operations': op_counts.get('add', 0),
            'mul_operations': op_counts.get('mul', 0),
            'div_operations': op_counts.get('div', 0),
            'cmp_operations': op_counts.get('setlt', 0) + op_counts.get('setgt', 0) + op_counts.get('seteq', 0),
            'select_operations': op_counts.get('select', 0),
            'sparsemux_operations': op_counts.get('sparsemux', 0)
        })
    
    # Add performance info
    if performance_info:
        result.update({
            'performance_target': performance_info.get('target', 'N/A'),
            'performance_estimated': performance_info.get('estimated', 'N/A'),
            'performance_achieved': performance_info.get('achieved', 'N/A')
        })
    
    # Add power info
    if power_info:
        result.update({
            'power_dynamic': power_info.get('dynamic', 'N/A'),
            'power_static': power_info.get('static', 'N/A'),
            'power_total': power_info.get('total', 'N/A')
        })
    
    print("\nParsed values:")
    for key, value in result.items():
        print(f"{key}: {value}")
    
    return result

def main():
    # Input and output paths
    report_path = '../hls_syn/hls_imp_report_output/detect_and_recognize_csynth.rpt'
    output_dir = '../output/hls_pars_output'
    os.makedirs(output_dir, exist_ok=True)
    
    # Parse report
    result = parse_report(report_path)
    if not result:
        return
    
    # Add synthesis date
    result['synthesis_date'] = datetime.fromtimestamp(os.path.getmtime(report_path)).strftime('%Y-%m-%d %H:%M:%S')
    
    # Write to CSV
    csv_path = os.path.join(output_dir, 'hls_synthesis_log.csv')
    fieldnames = [
        'module_name', 'clock_period', 'slack', 'min_latency', 'max_latency',
        'avg_latency', 'total_latency_ns', 'ii', 'trip_count', 'throughput_ops_per_ns',
        'LUTs', 'FFs', 'BRAMs', 'DSPs',
        's_axi_control_data_width', 's_axi_control_address_width', 's_axi_control_offset',
        'sw_io_frame_direction', 'sw_io_frame_datatype',
        'sw_io_result_direction', 'sw_io_result_datatype',
        'storage_bram', 'storage_uram',
        'total_operations', 'add_operations', 'mul_operations', 'div_operations',
        'cmp_operations', 'select_operations', 'sparsemux_operations',
        'performance_target', 'performance_estimated', 'performance_achieved',
        'power_dynamic', 'power_static', 'power_total',
        'synthesis_date'
    ]
    
    with open(csv_path, 'w', newline='') as f:
        writer = csv.DictWriter(f, fieldnames=fieldnames)
        writer.writeheader()
        writer.writerow(result)
    
    print(f"Synthesis summary saved to {csv_path}")

if __name__ == "__main__":
    main() 