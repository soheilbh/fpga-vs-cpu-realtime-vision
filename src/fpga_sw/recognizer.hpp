#ifndef RECOGNIZER_HPP
#define RECOGNIZER_HPP

#include <vector>
#include <string>
#include <cstdint>
#include "detector.hpp"

// Mapping table sorted by prefix sum (ascending)
const uint16_t char_prefix_sums[27] = {
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

class Recognizer {
public:
    Recognizer(bool verbose = false);
    
    char recognize(const std::vector<BlobOutput>& blobs);
    
private:
    uint16_t find_exact_match(uint16_t total_sum);
    bool verbose;
};

#endif // RECOGNIZER_HPP 