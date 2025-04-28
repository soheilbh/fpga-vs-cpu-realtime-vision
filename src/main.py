"""
Main entry point for the FPGA vs CPU real-time vision project.
"""

import time
from typing import Optional

from settings.config import (
    ENABLE_DETECTION,
    ENABLE_BLOB_DETECTION,
    ENABLE_PREFIX_SUM,
    ENABLE_MAPPING,
    TARGET_FPS,
    FRAME_WIDTH,
    FRAME_HEIGHT,
)

from frame_generator.generator import FrameGenerator
from detection.detector import Detector
from blob_detection.blob import BlobDetector
from prefix_sum.prefix_sum import PrefixSumCalculator
from mapping.mapper import Mapper
from logging.logger import setup_logger
from visualization.visualizer import Visualizer

logger = setup_logger(__name__)

class ProcessingPipeline:
    def __init__(self):
        self.frame_generator = FrameGenerator()
        self.detector = Detector() if ENABLE_DETECTION else None
        self.blob_detector = BlobDetector() if ENABLE_BLOB_DETECTION else None
        self.prefix_sum = PrefixSumCalculator() if ENABLE_PREFIX_SUM else None
        self.mapper = Mapper() if ENABLE_MAPPING else None
        self.visualizer = Visualizer()

    def process_frame(self, frame):
        """Process a single frame through the pipeline."""
        # Detection
        if self.detector:
            detected_pixels = self.detector.detect(frame)
        else:
            detected_pixels = frame

        # Blob Detection
        if self.blob_detector:
            blobs = self.blob_detector.find_blobs(detected_pixels)
        else:
            blobs = []

        # Prefix Sum
        if self.prefix_sum:
            prefix_sums = [self.prefix_sum.calculate(blob) for blob in blobs]
        else:
            prefix_sums = []

        # Mapping
        if self.mapper:
            mapped_letters = [self.mapper.map_to_letter(prefix_sum) for prefix_sum in prefix_sums]
        else:
            mapped_letters = []

        return {
            'frame': frame,
            'detected_pixels': detected_pixels,
            'blobs': blobs,
            'prefix_sums': prefix_sums,
            'mapped_letters': mapped_letters
        }

    def run(self, num_frames: Optional[int] = None):
        """Run the processing pipeline."""
        frame_count = 0
        start_time = time.time()

        try:
            while num_frames is None or frame_count < num_frames:
                # Generate frame
                frame = self.frame_generator.generate_frame()
                
                # Process frame
                results = self.process_frame(frame)
                
                # Visualize results
                self.visualizer.visualize(results)
                
                frame_count += 1
                
                # Maintain target FPS
                elapsed = time.time() - start_time
                target_time = frame_count / TARGET_FPS
                if elapsed < target_time:
                    time.sleep(target_time - elapsed)

        except KeyboardInterrupt:
            logger.info("Processing stopped by user")
        finally:
            # Calculate and log final statistics
            total_time = time.time() - start_time
            actual_fps = frame_count / total_time
            logger.info(f"Processed {frame_count} frames in {total_time:.2f} seconds")
            logger.info(f"Average FPS: {actual_fps:.2f}")

def main():
    """Main entry point."""
    pipeline = ProcessingPipeline()
    pipeline.run()

if __name__ == "__main__":
    main() 