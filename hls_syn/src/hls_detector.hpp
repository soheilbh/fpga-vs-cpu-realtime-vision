#ifndef HLS_DETECTOR_HPP
#define HLS_DETECTOR_HPP

#include <ap_int.h>
#include <hls_stream.h>

// Frame dimensions
#define FRAME_WIDTH 800
#define FRAME_HEIGHT 600

// Detection parameters
#define BRIGHT_PIXEL_THRESHOLD 160
#define MAX_QUEUE_SIZE 512  // Power of 2, enough for max blob size  observed 289
#define MAX_PREFIX_SUM 512  // Power of 2, enough for max prefix sum observed 289

// Structure to store blob information
struct BlobOutput {
    int prefix_sum;  // Sum of pixel intensities
    int min_x;       // Bounding box coordinates
    int min_y;
    int max_x;
    int max_y;
};

// Function declarations
void detect_frame(
    ap_uint<8> frame[FRAME_HEIGHT][FRAME_WIDTH],
    BlobOutput& blob
);

// Helper functions
void get_neighbors(
    int x, int y,
    int neighbors[4][2],
    int& count
);

void flood_fill(
    ap_uint<8> frame[FRAME_HEIGHT][FRAME_WIDTH],
    int start_x, int start_y,
    BlobOutput& blob
);

#endif // HLS_DETECTOR_HPP 