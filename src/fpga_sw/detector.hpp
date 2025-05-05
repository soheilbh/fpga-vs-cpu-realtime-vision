#ifndef DETECTOR_HPP
#define DETECTOR_HPP

#include <vector>
#include <cstdint>

// Frame dimensions
#define FRAME_WIDTH 800
#define FRAME_HEIGHT 600

// Detection parameters
#define BRIGHT_PIXEL_THRESHOLD 160
#define MAX_QUEUE_SIZE 512  // Power of 2, enough for max blob size observed 289
#define MAX_PREFIX_SUM 512  // Power of 2, enough for max prefix sum observed 289

struct BlobOutput {
    uint16_t prefix_sum;  // Sum of pixel intensities (9 bits needed for 512)
    int min_x;           // Bounding box coordinates
    int min_y;
    int max_x;
    int max_y;
    
    BlobOutput() {
        min_x = FRAME_WIDTH;
        min_y = FRAME_HEIGHT;
        max_x = 0;
        max_y = 0;
        prefix_sum = 0;
    }
};

class Detector {
public:
    Detector();
    
    BlobOutput detect(const std::vector<std::vector<uint8_t>>& frame);
    
private:
    bool is_bright_pixel(uint8_t pixel);
    int get_neighbors(int x, int y, int neighbors[][2]);
    void flood_fill(const std::vector<std::vector<uint8_t>>& frame, int start_x, int start_y, BlobOutput& blob);
};

#endif // DETECTOR_HPP 