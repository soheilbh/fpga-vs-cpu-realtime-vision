# FPGA vs CPU Real-time Vision

This project compares the performance of FPGA and CPU implementations for real-time vision tasks, specifically focusing on character recognition in video streams. The system processes video frames in real-time, detecting and recognizing characters with high accuracy and low latency.

## Key Features

- Real-time character detection and recognition
- High frame rate processing (32 FPS target)
- FPGA and CPU implementation comparison
- Comprehensive performance metrics
- Automated testing and analysis pipeline
- Detailed HLS synthesis reports

## Project Structure

```
.
├── src/                    # Source code
│   ├── calibration/        # Calibration tools
│   ├── detection/          # Character detection
│   ├── recognition/        # Character recognition
│   ├── settings/           # Configuration files
│   └── utils/             # Utility functions
├── scripts/                # Python scripts
│   ├── generate_full_alphabet_frames.py
│   ├── calibrate_letters.py
│   ├── batch_combination_finder.py
│   ├── generate_batch_frame.py
│   ├── create_batch_manifest.py
│   ├── build_sequence.py
│   ├── play_sequence.py
│   └── parse_hls_report.py
├── output/                 # Generated outputs
│   ├── frames/            # Generated frames
│   ├── calibration/       # Calibration data
│   ├── batches/           # Batch frames
│   ├── sequence/          # Video sequences
│   ├── logs/              # Log files
│   └── hls_pars_output/   # HLS synthesis reports
├── hls_syn/               # HLS synthesis files
├── preprocess_data.py     # Data preprocessing script
├── run_analysis.py        # Analysis script
└── requirements.txt       # Python dependencies
```

## Technical Specifications

### Hardware Requirements
- FPGA: Xilinx Zynq-7000 series
- CPU: Modern multi-core processor
- Memory: Minimum 4GB RAM
- Storage: 1GB free space

### Software Requirements
- Python 3.8+
- OpenCV 4.5+
- NumPy 1.21+
- Xilinx Vitis HLS 2021.1+

## Setup

1. Install Python dependencies:
```bash
pip install -r requirements.txt
```

2. Configure environment variables in `.env` file:
```bash
cp .env.example .env
# Edit .env with your settings
```

## Usage

### Data Preprocessing
Run the preprocessing pipeline to generate and calibrate character frames:
```bash
python3 preprocess_data.py
```
This will:
- Generate frames for all characters
- Calibrate character positions and sizes
- Find optimal batch combinations

### Analysis
Run the analysis pipeline to generate and test video sequences:
```bash
python3 run_analysis.py
```
This will:
- Generate batch frames
- Create sequence manifests
- Build video sequences
- Play and analyze sequences

### HLS Synthesis
Parse HLS synthesis reports:
```bash
python3 scripts/parse_hls_report.py
```
This will extract:
- Resource utilization
- Timing information
- Performance metrics

## Scripts Description

### Preprocessing Scripts
- `generate_full_alphabet_frames.py`: 
  - Generates frames for all characters
  - Supports multiple font sizes
  - Adds noise and distortion
- `calibrate_letters.py`: 
  - Calibrates character positions
  - Measures character sizes
  - Generates calibration data
- `batch_combination_finder.py`: 
  - Finds optimal batch combinations
  - Optimizes memory usage
  - Reduces processing time

### Analysis Scripts
- `generate_batch_frame.py`: 
  - Generates test frames
  - Creates batch manifests
  - Manages frame sequences
- `create_batch_manifest.py`: 
  - Creates sequence manifests
  - Tracks frame order
  - Manages metadata
- `build_sequence.py`: 
  - Builds video sequences
  - Manages memory usage
  - Optimizes frame order
- `play_sequence.py`: 
  - Plays sequences
  - Measures performance
  - Logs results
- `parse_hls_report.py`: 
  - Parses synthesis reports
  - Extracts metrics
  - Generates summaries

## Output Files

### Frame Generation
- `output/frames/`: 
  - Character frames (PNG)
  - Frame metadata (JSON)
  - Calibration data

### Calibration
- `output/calibration/`: 
  - Character positions
  - Size measurements
  - Calibration parameters

### Batch Processing
- `output/batches/`: 
  - Batch frames
  - Manifest files
  - Sequence data

### Analysis
- `output/sequence/`: 
  - Video sequences
  - Frame labels
  - Performance data
- `output/logs/`: 
  - Processing logs
  - Performance metrics
  - Error reports

### HLS Synthesis
- `output/hls_pars_output/`: 
  - Resource utilization
  - Timing reports
  - Performance summaries

## Performance Metrics

### Timing Metrics
- Frame processing time
- Character detection latency
- Recognition delay
- Total pipeline latency

### Resource Utilization
- LUT usage
- FF usage
- BRAM usage
- DSP usage

### FPGA Metrics
- Clock period
- Slack time
- Initiation interval
- Pipeline depth

### Accuracy Metrics
- Character detection rate
- Recognition accuracy
- False positive rate
- False negative rate

## Development Workflow

1. **Data Preparation**
   - Generate test frames
   - Calibrate characters
   - Create sequences

2. **Implementation**
   - Develop CPU version
   - Implement FPGA design
   - Optimize both versions

3. **Testing**
   - Run test sequences
   - Measure performance
   - Compare results

4. **Analysis**
   - Parse HLS reports
   - Generate metrics
   - Create summaries

## Contributing

1. Fork the repository
2. Create a feature branch
3. Commit your changes
4. Push to the branch
5. Create a Pull Request

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Contact

For questions or support, please contact:
- Email: [your-email@example.com]
- GitHub: [your-github-profile]
