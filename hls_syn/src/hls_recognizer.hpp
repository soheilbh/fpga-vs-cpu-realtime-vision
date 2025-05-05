#ifndef HLS_RECOGNIZER_HPP
#define HLS_RECOGNIZER_HPP

#include <ap_int.h>
#include "hls_detector.hpp"

// Mapping table sorted by prefix sum (ascending)
const int char_prefix_sums[27] = {
    80,   // I
    125,   // J
    127,   // L
    144,   // T
    155,   // *
    156,   // Y
    158,   // F
    159,   // V
    171,   // C
    186,   // U
    187,   // K
    188,   // S
    190,   // A
    194,   // P
    196,   // Z
    198,   // X
    199,   // H
    205,   // E
    211,   // O
    213,   // D
    218,   // G
    237,   // R
    239,   // N
    241,   // Q
    274,   // B
    281,   // W
    289,   // M
};

const char prefix_sum_to_char[27] = {
    'I', 'J', 'L', 'T', '*', 'Y', 'F', 'V', 'C', 'U',
    'K', 'S', 'A', 'P', 'Z', 'X', 'H', 'E', 'O', 'D',
    'G', 'R', 'N', 'Q', 'B', 'W', 'M'
};

// Helper function
ap_uint<8> find_exact_match(int target);

/**
 * @brief Recognizes a character based on the prefix sum of a single detected blob.
 * 
 * This function takes a single blob's prefix sum and maps it to a character
 * using binary search in a sorted mapping table.
 * The mapping table contains predefined prefix sums for each character (A-Z and space).
 * 
 * @param blob The detected blob containing its prefix sum
 * @param result The recognized character:
 *             - '_' if no blob is detected
 *             - '?' if no exact match is found in the mapping table
 *             - The corresponding character (A-Z or space) if an exact match is found
 */
void recognize_character(const BlobOutput& blob, char& result);

#endif // HLS_RECOGNIZER_HPP 