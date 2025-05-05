#include "hls_detector.hpp"
#include "hls_recognizer.hpp"

// Top-level detection function
void detect_top(
    ap_uint<8> frame[FRAME_HEIGHT][FRAME_WIDTH],
    BlobOutput& blob
) {
    #pragma HLS INTERFACE ap_ctrl_none port=return
    #pragma HLS INTERFACE bram port=frame
    #pragma HLS INTERFACE bram port=blob
    #pragma HLS ARRAY_PARTITION variable=frame type=block factor=8 dim=2

    detect_frame(frame, blob);
}

// Top-level recognition function
char recognize_top(
    const BlobOutput& blob
) {
    #pragma HLS INTERFACE ap_ctrl_none port=return
    #pragma HLS INTERFACE bram port=blob

    char result;
    recognize_character(blob, result);
    return result;
}

// Top-level combined detection and recognition function
void detect_and_recognize(
    ap_uint<8> frame[FRAME_HEIGHT][FRAME_WIDTH],
    char& result
) {
    #pragma HLS INTERFACE s_axilite port=return bundle=control
    #pragma HLS INTERFACE s_axilite port=result bundle=control
    #pragma HLS INTERFACE bram port=frame
    #pragma HLS ARRAY_PARTITION variable=frame type=block factor=8 dim=2

    // Internal blob storage (plain struct, no stream)
    BlobOutput blob;

    detect_frame(frame, blob);
    recognize_character(blob, result);
}