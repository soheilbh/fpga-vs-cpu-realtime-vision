#include "hls_detector.hpp"
#include <algorithm>

// Function to check if a pixel is above threshold
bool is_bright_pixel(ap_uint<8> pixel) {
    #pragma HLS INLINE
    return pixel > BRIGHT_PIXEL_THRESHOLD;
}

// Function to get valid neighbors (4-connectivity)
void get_neighbors(
    int x,
    int y,
    int neighbors[4][2],
    int& count
) {
    count = 0;
    
    // Check up
    if (y > 0) {
        neighbors[count][0] = x;
        neighbors[count][1] = y - 1;
        count++;
    }
    
    // Check down
    if (y < FRAME_HEIGHT - 1) {
        neighbors[count][0] = x;
        neighbors[count][1] = y + 1;
        count++;
    }
    
    // Check left
    if (x > 0) {
        neighbors[count][0] = x - 1;
        neighbors[count][1] = y;
        count++;
    }
    
    // Check right
    if (x < FRAME_WIDTH - 1) {
        neighbors[count][0] = x + 1;
        neighbors[count][1] = y;
        count++;
    }
}

// Function to perform flood fill
void flood_fill(
    ap_uint<8> frame[FRAME_HEIGHT][FRAME_WIDTH],
    int start_x, int start_y,
    BlobOutput& blob
) {
    // Local visited array with HLS directives
    ap_uint<1> visited[FRAME_HEIGHT * FRAME_WIDTH];
    #pragma HLS bind_storage variable=visited type=RAM_2P impl=lutram
    
    // Initialize visited array
   for (int i = 0; i < FRAME_HEIGHT * FRAME_WIDTH; i += 64) {
        #pragma HLS PIPELINE II=1
        for (int j = 0; j < 64; j++) {
            #pragma HLS UNROLL
            visited[i + j] = 0;
        }
    }
    
    // Initialize blob properties
    blob.min_x = FRAME_WIDTH;
    blob.min_y = FRAME_HEIGHT;
    blob.max_x = 0;
    blob.max_y = 0;
    blob.prefix_sum = 0;
    
    // Fixed-size queue for flood fill
    int queue_x[MAX_QUEUE_SIZE];
    int queue_y[MAX_QUEUE_SIZE];
    int queue_front = 0;
    int queue_back = 0;
    
    // Add starting point to queue
    queue_x[queue_back] = start_x;
    queue_y[queue_back] = start_y;
    queue_back++;
    if (queue_back == MAX_QUEUE_SIZE) queue_back = 0;
    int index = start_y * FRAME_WIDTH + start_x;
    visited[index] = 1;
    
    
    for (int loop_count = 0; loop_count < MAX_QUEUE_SIZE && queue_front != queue_back; loop_count++) {
        #pragma HLS PIPELINE II=1
        // Get next point from queue
        int x = queue_x[queue_front];
        int y = queue_y[queue_front];
        queue_front++;
        if (queue_front == MAX_QUEUE_SIZE) queue_front = 0;
        
        // Update blob properties
        blob.min_x = (x < blob.min_x) ? x : blob.min_x;
        blob.min_y = (y < blob.min_y) ? y : blob.min_y;
        blob.max_x = (x > blob.max_x) ? x : blob.max_x;
        blob.max_y = (y > blob.max_y) ? y : blob.max_y;
        
        // Add 1 to prefix sum for each bright pixel, matching non-HLS version
        if (is_bright_pixel(frame[y][x])) {
            if (blob.prefix_sum < MAX_PREFIX_SUM) {
                blob.prefix_sum += 1;
            }
        }
        
        // Get neighbors
        int neighbors[4][2];
        int num_neighbors;
        get_neighbors(x, y, neighbors, num_neighbors);
        
        // Process neighbors
        #pragma HLS DEPENDENCE variable=visited inter false
        for (int i = 0; i < num_neighbors; i++) {
            int nx = neighbors[i][0];
            int ny = neighbors[i][1];
            
            int index = ny * FRAME_WIDTH + nx;
            if (!visited[index] && is_bright_pixel(frame[ny][nx])) {
                visited[index] = 1;
                queue_x[queue_back] = nx;
                queue_y[queue_back] = ny;
                queue_back++;
                if (queue_back == MAX_QUEUE_SIZE) queue_back = 0;
            }
        }
    }
}

// Main detection function
void detect_frame(
    ap_uint<8> frame[FRAME_HEIGHT][FRAME_WIDTH],
    BlobOutput& blob
) {
    // Initialize blob as invalid
    blob.min_x = FRAME_WIDTH;
    blob.min_y = FRAME_HEIGHT;
    blob.max_x = 0;
    blob.max_y = 0;
    blob.prefix_sum = 0;
    
    // Find first valid blob
    for (int y = 0; y < FRAME_HEIGHT; y++) {
        for (int x = 0; x < FRAME_WIDTH; x++) {
            if (is_bright_pixel(frame[y][x])) {
                flood_fill(frame, x, y, blob);
                return; // Return after finding first blob
            }
        }
    }
} 