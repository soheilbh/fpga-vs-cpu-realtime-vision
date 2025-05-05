#include "hls_recognizer.hpp"

// Binary search to find exact match
ap_uint<8> find_exact_match(int target) {
    #pragma HLS PIPELINE II=1
    ap_uint<8> left = 0;
    ap_uint<8> right = 26;  // 27 elements (0-26)
    
    while (left <= right) {
        #pragma HLS LOOP_TRIPCOUNT min=1 max=5
        ap_uint<8> mid = (left + right) >> 1;
        
        if (char_prefix_sums[mid] == target) {
            return mid;
        } else if (char_prefix_sums[mid] < target) {
            left = mid + 1;
        } else {
            right = mid - 1;
        }
    }
    
    return 27;  // Not found
}

void recognize_character(const BlobOutput& blob, char& result) {
    #pragma HLS PIPELINE II=1
    
    // Special case: no blobs detected
    if (blob.prefix_sum == 0) {
        result = '_';
        return;
    }
    
    // Use binary search to find the character
    ap_uint<8> index = find_exact_match(blob.prefix_sum);
    if (index < 27) {
        result = prefix_sum_to_char[index];
    } else {
        result = '?';
    }
} 