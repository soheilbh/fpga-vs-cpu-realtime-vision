
# FPGA vs CPU Real-Time Processing Project Plan

## Project Title
**Comparative Real-Time Processing of Visual Data: FPGA vs CPU**

## Objective
Demonstrate and analyze the real-time performance differences between FPGA and CPU when processing simple but time-sensitive visual data (letter detection, prefix sum computation, and mapping).

---

## Phase 0 — Project Definition

| Aspect | Description |
|:------:|:-----------:|
| Goal | Compare real-time computational capabilities of FPGA and CPU on lightweight vision tasks |
| General Method | Generate frames with letters and noise → Detect letters → Compute feature (e.g., prefix sum) → Map to output letters → Decode final message |
| Tools | Python (for CPU simulation), Vivado HLS (for FPGA HLS design), Vivado Design Suite (for full FPGA implementation) |
| Resolution Target | 2048 x 2048 pixels (adjustable) |
| Frame Rate Target | Minimum 30 FPS |
| Output Quality | Reconstruct a clear and interpretable message without errors |

---

## Phase 1 — Modular Software Framework (Python)

### 1.1 Project Structure

```
project/
    ├── settings.py
    ├── main.py
    ├── generator.py
    ├── detection.py
    ├── blob.py
    ├── prefix_sum.py
    ├── mapping.py
    ├── logger.py
    └── visualization.py
```

### 1.2 Key Features
- Fully modular design
- Ability to enable/disable each processing stage individually (via settings.py)
- Logging and profiling support for each stage
- Configurable frame generation (resolution, noise percentage, number of letters)
- Support for visualizing inputs/outputs at every stage

---

## Phase 2 — Algorithm Design

### 2.1 Frame Processing Flow
1. Detect bright pixels (basic pixel thresholding)
2. Blob detection (group contiguous bright pixels)
3. Prefix sum computation per blob
4. Frame validation using pixel count thresholds
5. Mapping result to output letter
6. Building final decoded message

### 2.2 Design Constraints
- The same algorithms must be used for CPU and FPGA implementations.
- No bias optimization toward any platform.

---

## Phase 3 — FPGA HLS Development

### 3.1 HLS Coding
- Develop Detection, Blob, Prefix Sum, and Mapping modules in C/C++.
- Apply HLS optimizations:
  - `#pragma HLS PIPELINE`
  - `#pragma HLS DATAFLOW`
  - Loop unrolling
  - Using `hls::stream` for efficient data passing

### 3.2 Output
- HLS synthesis report (resource utilization and latency)
- Export HLS IP core

---

## Phase 4 — Full FPGA Implementation

### 4.1 Vivado Integration
- Import HLS IP core into Vivado block design
- Connect to input/output ports (AXI Stream or Memory Mapped)
- Create Top-level design (clock/reset management)

### 4.2 Implementation Flow
- Synthesize FPGA design
- Implement (place and route)
- Generate Bitstream (.bit file)
- Flash FPGA board using JTAG/USB Programmer

---

## Phase 5 — Results Analysis

| Metric | Description |
|:------:|:-----------:|
| Processing Speed | Frames per second comparison (CPU vs FPGA) |
| Accuracy | Correct vs erroneous frame processing rate |
| Resource Utilization | FPGA resource usage (LUTs, FFs, BRAMs, DSPs) |
| Visual Output | Message decoding quality |
| (Optional) Power Consumption | Rough estimation of energy efficiency |

---

## Phase 6 — Final Report and Presentation

### 6.1 Report Contents
- Executive summary (project goal and significance)
- Development and implementation process (all phases)
- Quantitative results (tables, charts)
- Visual results (frame sequences, videos)
- Analysis and interpretation
- Challenges and lessons learned
- Future Work (e.g., Active Learning, Dynamic Pipelines)

---

# Additional Notes

## Key Design Philosophies
- **CPU Version:** Stage-by-stage modular architecture (for clarity, debugging, profiling).
- **FPGA Version:** Fully pipelined, stream-connected architecture (for maximal performance).
- **Fairness:** Identical algorithms used for CPU and FPGA without optimization bias.

## Suggested Development Order
1. Setup modular Python framework (Phase 1)
2. Implement CPU simulation pipeline
3. Validate and tune parameters (e.g., frame size, noise level)
4. Transition algorithms to C/C++ for HLS
5. Complete HLS synthesis and export IP
6. Build FPGA project in Vivado
7. Program FPGA and collect performance data
8. Final comparison and report preparation

---

# Ready to Start
**First step: Build the modular Python skeleton and develop the frame generator.**
