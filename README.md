# Comparative Real-Time Processing of Visual Data: FPGA vs CPU

This project aims to demonstrate and analyze the real-time performance differences between FPGA and CPU when processing simple but time-sensitive visual data. The comparison focuses on three main tasks:
- Letter detection
- Prefix sum computation
- Mapping and message decoding

## Project Structure

```
fpga-vs-cpu-realtime-vision/
├── src/
│   ├── settings/          # Configuration and settings management
│   ├── frame_generator/   # Frame generation and input handling
│   ├── detection/         # Letter detection algorithms
│   ├── blob_detection/    # Blob detection implementation
│   ├── prefix_sum/        # Prefix sum calculations
│   ├── mapping/           # Letter mapping and message decoding
│   ├── logging/           # Logging and performance metrics
│   └── visualization/     # Results visualization
├── docs/                  # Project documentation and plans
└── tests/                 # Test suite
```

## Key Features

- Real-time frame processing at 2048x2048 resolution, 30+ FPS
- Modular design with independently configurable processing stages
- Comprehensive logging and profiling support
- Configurable frame generation (resolution, noise, letters)
- Visual debugging tools for each processing stage
- Fair comparison between CPU and FPGA implementations

## Technical Specifications

- **Target Resolution**: 2048 x 2048 pixels
- **Target Frame Rate**: Minimum 30 FPS
- **Processing Pipeline**:
  1. Frame generation with letters and noise
  2. Bright pixel detection
  3. Blob detection
  4. Prefix sum computation
  5. Frame validation
  6. Letter mapping
  7. Message decoding

## Setup

1. Clone the repository:
```bash
git clone https://github.com/yourusername/fpga-vs-cpu-realtime-vision.git
cd fpga-vs-cpu-realtime-vision
```

2. Create a virtual environment:
```bash
python -m venv venv
source venv/bin/activate  # On Windows: venv\Scripts\activate
```

3. Install dependencies:
```bash
pip install -r requirements.txt
```

## Development Phases

1. Modular Python Framework
2. CPU Implementation
3. FPGA HLS Development
4. Full FPGA Implementation
5. Performance Analysis
6. Final Report

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

[License information will be added]
