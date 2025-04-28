"""
Configuration settings for the FPGA vs CPU real-time vision project.
"""

# Frame Generation Settings
FRAME_WIDTH = 2048
FRAME_HEIGHT = 2048
TARGET_FPS = 30
NOISE_PERCENTAGE = 0.1  # 10% noise in generated frames
MAX_LETTERS_PER_FRAME = 5

# Processing Pipeline Settings
ENABLE_DETECTION = True
ENABLE_BLOB_DETECTION = True
ENABLE_PREFIX_SUM = True
ENABLE_MAPPING = True

# Detection Settings
BRIGHT_PIXEL_THRESHOLD = 200  # Pixel intensity threshold for detection
MIN_BLOB_SIZE = 10  # Minimum number of pixels for a valid blob
MAX_BLOB_SIZE = 1000  # Maximum number of pixels for a valid blob

# Logging Settings
LOG_LEVEL = "INFO"  # DEBUG, INFO, WARNING, ERROR, CRITICAL
ENABLE_PERFORMANCE_LOGGING = True
PERFORMANCE_LOG_INTERVAL = 100  # Log performance metrics every N frames

# Visualization Settings
ENABLE_VISUALIZATION = True
VISUALIZATION_FPS = 10  # FPS for visualization (can be lower than processing FPS)
SAVE_VISUALIZATION = False
VISUALIZATION_OUTPUT_DIR = "output/visualization"

# FPGA Settings
FPGA_CLOCK_FREQUENCY = 100e6  # 100 MHz
FPGA_BITSTREAM_PATH = "fpga/bitstream.bit"

# Output Settings
OUTPUT_DIR = "output"
RESULTS_FILE = "results.csv"
