#include <iostream>
#include <fstream>
#include <vector>
#include <cstdint>
#include <string>
#include <algorithm>
#include "detector.hpp"

Detector::Detector() {
    // No initialization needed as we use defines now
}

bool Detector::is_bright_pixel(uint8_t pixel) {
    return pixel > BRIGHT_PIXEL_THRESHOLD;
}

int Detector::get_neighbors(int x, int y, int neighbors[][2]) {
    int count = 0;
    
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
    
    return count;
}

void Detector::flood_fill(const std::vector<std::vector<uint8_t>>& frame, int start_x, int start_y, BlobOutput& blob) {
    // Initialize visited array as 1D array
    std::vector<bool> visited(FRAME_HEIGHT * FRAME_WIDTH, false);
    
    // Initialize queue
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
    visited[index] = true;
    
    for (int loop_count = 0; loop_count < MAX_QUEUE_SIZE && queue_front != queue_back; loop_count++) {
        // Get next point from queue
        int x = queue_x[queue_front];
        int y = queue_y[queue_front];
        queue_front++;
        if (queue_front == MAX_QUEUE_SIZE) queue_front = 0;
        
        // Update blob properties using ternary operators
        blob.min_x = (x < blob.min_x) ? x : blob.min_x;
        blob.min_y = (y < blob.min_y) ? y : blob.min_y;
        blob.max_x = (x > blob.max_x) ? x : blob.max_x;
        blob.max_y = (y > blob.max_y) ? y : blob.max_y;
        
        // Add 1 to prefix sum for each bright pixel
        if (is_bright_pixel(frame[y][x])) {
            if (blob.prefix_sum < MAX_PREFIX_SUM) {
                blob.prefix_sum += 1;
            }
        }
        
        // Get neighbors
        int neighbors[4][2];
        int num_neighbors = get_neighbors(x, y, neighbors);
        
        // Process neighbors
        for (int i = 0; i < num_neighbors; i++) {
            int nx = neighbors[i][0];
            int ny = neighbors[i][1];
            
            int index = ny * FRAME_WIDTH + nx;
            if (!visited[index] && is_bright_pixel(frame[ny][nx])) {
                visited[index] = true;
                queue_x[queue_back] = nx;
                queue_y[queue_back] = ny;
                queue_back++;
                if (queue_back == MAX_QUEUE_SIZE) queue_back = 0;
            }
        }
    }
}

BlobOutput Detector::detect(const std::vector<std::vector<uint8_t>>& frame) {
    BlobOutput blob;
    
    // Find first valid blob
    for (int y = 0; y < FRAME_HEIGHT; y++) {
        for (int x = 0; x < FRAME_WIDTH; x++) {
            if (is_bright_pixel(frame[y][x])) {
                flood_fill(frame, x, y, blob);
                return blob;
            }
        }
    }
    
    return blob;
} 