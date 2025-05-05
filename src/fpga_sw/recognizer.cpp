#include <iostream>
#include <fstream>
#include <vector>
#include <string>
#include <algorithm>
#include "recognizer.hpp"

Recognizer::Recognizer(bool verbose) : verbose(verbose) {
    if (verbose) {
        std::cout << "Recognizer initialized with hardcoded mapping table" << std::endl;
        std::cout << "Prefix sums and characters:" << std::endl;
        for (size_t i = 0; i < 27; i++) {
            std::cout << "  " << prefix_sum_to_char[i] << ": " << char_prefix_sums[i] << std::endl;
        }
    }
}

uint16_t Recognizer::find_exact_match(uint16_t total_sum) {
    uint16_t left = 0;
    uint16_t right = 26;  // 27 elements (0-26)
    
    while (left <= right) {
        uint16_t mid = (left + right) >> 1;  // Use bit shift like HLS version
        
        if (char_prefix_sums[mid] == total_sum) {
            return mid;  // Return index like HLS version
        } else if (char_prefix_sums[mid] < total_sum) {
            left = mid + 1;
        } else {
            right = mid - 1;
        }
    }
    
    return 27;  // Not found, like HLS version
}

char Recognizer::recognize(const std::vector<BlobOutput>& blobs) {
    // Special case: no blobs detected
    if (blobs.empty()) {
        return '_';
    }
    
    // Use only the first blob like HLS version
    uint16_t total_sum = blobs[0].prefix_sum;
    
    // Debug output if verbose
    if (verbose) {
        std::cout << "Total sum: " << total_sum << std::endl;
    }
    
    // Find exact match using binary search
    uint16_t index = find_exact_match(total_sum);
    char result;
    
    if (index < 27) {
        result = prefix_sum_to_char[index];
    } else {
        result = '?';
    }
    
    if (verbose) {
        if (result == '?') {
            std::cout << "No mapping found for prefix sum " << total_sum << std::endl;
        } else {
            std::cout << "Found character '" << result << "' for prefix sum " << total_sum << std::endl;
        }
    }
    
    return result;
} 