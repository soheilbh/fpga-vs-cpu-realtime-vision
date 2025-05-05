#include <iostream>
#include <fstream>
#include <vector>
#include <string>
#include <chrono>
#include <thread>
#include <iomanip>
#include <ctime>
#include <filesystem>
#include "src/fpga_sw/detector.hpp"
#include "src/fpga_sw/recognizer.hpp"

namespace fs = std::filesystem;

// Constants from config
const int TARGET_FPS = 32;
const int VIDEO_DURATION = 10; // seconds

struct Frame {
    std::vector<std::vector<uint8_t>> data;
    
    Frame() : data(FRAME_HEIGHT, std::vector<uint8_t>(FRAME_WIDTH)) {}
};

struct Arguments {
    std::string input_file = "../input/input.txt";
    std::string output_dir = "../output/logs";
};

Arguments parse_arguments(int argc, char* argv[]) {
    Arguments args;
    
    for (int i = 1; i < argc; i++) {
        std::string arg = argv[i];
        if (arg == "--input-file" && i + 1 < argc) {
            args.input_file = argv[++i];
        } else if (arg == "--output-dir" && i + 1 < argc) {
            args.output_dir = argv[++i];
        }
    }
    
    return args;
}

std::vector<std::string> read_sequences(const std::string& input_file) {
    std::vector<std::string> sequences;
    std::ifstream file(input_file);
    
    if (!file) {
        throw std::runtime_error("Failed to open input file: " + input_file);
    }
    
    std::string line;
    while (std::getline(file, line)) {
        if (!line.empty()) {
            // Replace spaces with underscores
            std::replace(line.begin(), line.end(), ' ', '_');
            sequences.push_back(line);
        }
    }
    
    return sequences;
}

void load_sequence(const std::string& sequence_name, std::vector<Frame>& sequence) {
    std::string filename = "../output/sequence/sequence_" + sequence_name + ".npy";
    std::ifstream file(filename, std::ios::binary);
    
    if (!file) {
        throw std::runtime_error("Failed to open sequence file: " + filename);
    }
    
    // Skip numpy header (we know the format)
    file.seekg(0, std::ios::beg);
    
    // Read data directly into frames
    for (auto& frame : sequence) {
        for (int y = 0; y < FRAME_HEIGHT; y++) {
            for (int x = 0; x < FRAME_WIDTH; x++) {
                uint8_t pixel;
                file.read(reinterpret_cast<char*>(&pixel), sizeof(pixel));
                frame.data[y][x] = pixel;
            }
        }
    }
}

void play_sequence(const std::string& sequence_name, const std::string& output_dir) {
    std::cout << "\nProcessing sequence: " << sequence_name << std::endl;
    
    // Initialize sequence
    std::vector<Frame> sequence(TARGET_FPS * VIDEO_DURATION);
    load_sequence(sequence_name, sequence);
    
    std::cout << "Successfully loaded sequence with " << sequence.size() << " frames" << std::endl;
    std::cout << "Frame shape: (" << FRAME_HEIGHT << ", " << FRAME_WIDTH << ")" << std::endl;
    
    // Print frame statistics for the first frame
    int min_val = 255, max_val = 0;
    for (int y = 0; y < FRAME_HEIGHT; y++) {
        for (int x = 0; x < FRAME_WIDTH; x++) {
            min_val = std::min(min_val, (int)sequence[0].data[y][x]);
            max_val = std::max(max_val, (int)sequence[0].data[y][x]);
        }
    }
    std::cout << "First frame statistics:" << std::endl;
    std::cout << "  Min value: " << min_val << std::endl;
    std::cout << "  Max value: " << max_val << std::endl;
    
    // Initialize detector and recognizer
    Detector detector;
    Recognizer recognizer(true);
    
    // Create output directory
    fs::create_directories(output_dir);
    std::string log_filename = output_dir + "/sequence_log_" + sequence_name + "_cpp.csv";
    
    // Open log file
    std::ofstream log_file(log_filename);
    log_file << "frame_index,recognized_character,prefix_sum,detection_time_ms,recognition_time_ms,total_frame_time_ms\n";
    
    // Process each frame
    auto start_time = std::chrono::high_resolution_clock::now();
    std::string recognized_string;
    
    // Progress bar setup
    const int total_frames = sequence.size();
    const int progress_width = 50;
    
    for (size_t i = 0; i < sequence.size(); i++) {
        // Update progress bar
        int progress = (i * progress_width) / total_frames;
        std::cout << "\r[";
        for (int j = 0; j < progress_width; j++) {
            std::cout << (j < progress ? "=" : " ");
        }
        std::cout << "] " << (i * 100) / total_frames << "%";
        std::cout.flush();
        
        auto frame_start_time = std::chrono::high_resolution_clock::now();
        
        // Detect blob
        auto detection_start = std::chrono::high_resolution_clock::now();
        BlobOutput blob = detector.detect(sequence[i].data);
        auto detection_time = std::chrono::duration_cast<std::chrono::microseconds>(
            std::chrono::high_resolution_clock::now() - detection_start).count() / 1000.0;
        
        // Recognize character
        auto recognition_start = std::chrono::high_resolution_clock::now();
        std::vector<BlobOutput> blobs;
        if (blob.prefix_sum > 0) {
            blobs.push_back(blob);
        }
        char character = recognizer.recognize(blobs);
        auto recognition_time = std::chrono::duration_cast<std::chrono::microseconds>(
            std::chrono::high_resolution_clock::now() - recognition_start).count() / 1000.0;
        
        // Calculate total frame processing time
        auto total_frame_time = std::chrono::duration_cast<std::chrono::microseconds>(
            std::chrono::high_resolution_clock::now() - frame_start_time).count() / 1000.0;
        
        // Log results
        log_file << i << "," 
                << character << "," 
                << blob.prefix_sum << ","
                << std::fixed << std::setprecision(3) << detection_time << ","
                << recognition_time << ","
                << total_frame_time << "\n";
        
        // Add character to recognized string if not '_'
        if (character != '_') {
            recognized_string += character;
        }
        
        // Calculate time to sleep to maintain target FPS
        auto elapsed = std::chrono::duration_cast<std::chrono::microseconds>(
            std::chrono::high_resolution_clock::now() - start_time).count() / 1000000.0;
        double target_time = i / static_cast<double>(TARGET_FPS);
        double sleep_time = std::max(0.0, target_time - elapsed);
        std::this_thread::sleep_for(std::chrono::duration<double>(sleep_time));
    }
    
    std::cout << "\n"; // New line after progress bar
    
    // Calculate final statistics
    auto total_duration = std::chrono::duration_cast<std::chrono::microseconds>(
        std::chrono::high_resolution_clock::now() - start_time).count() / 1000000.0;
    double actual_fps = sequence.size() / total_duration;
    
    std::cout << "\nPlayback complete!" << std::endl;
    std::cout << "Log saved to: " << log_filename << std::endl;
    std::cout << "\nPerformance Summary:" << std::endl;
    std::cout << "Total playback duration: " << std::fixed << std::setprecision(2) << total_duration << " seconds" << std::endl;
    std::cout << "Average FPS: " << std::fixed << std::setprecision(2) << actual_fps << std::endl;
    std::cout << "\nRecognition Results:" << std::endl;
    std::cout << "Final recognized string: " << recognized_string << std::endl;
    std::cout << "Total recognized characters: " << recognized_string.length() << std::endl;
}

int main(int argc, char* argv[]) {
    try {
        // Parse command line arguments
        Arguments args = parse_arguments(argc, argv);
        
        // Read sequences from input file
        std::vector<std::string> sequences = read_sequences(args.input_file);
        std::cout << "Found " << sequences.size() << " sequences to process" << std::endl;
        
        // Process each sequence
        for (const auto& sequence_name : sequences) {
            play_sequence(sequence_name, args.output_dir);
        }
        
    } catch (const std::exception& e) {
        std::cerr << "Error: " << e.what() << std::endl;
        return 1;
    }
    
    return 0;
} 