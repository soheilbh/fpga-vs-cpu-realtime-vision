# Create project
open_project -reset hls_design_output

# Add source files
add_files src/hls_detector.cpp
add_files src/hls_detector.hpp
add_files src/hls_recognizer.cpp
add_files src/hls_recognizer.hpp
add_files src/hls_wrapper.cpp

# Create report folder
file mkdir hls_imp_report_output

# Set top function
set_top detect_and_recognize

# Create solution
open_solution -reset solution1
set_part xc7z020clg400-1
create_clock -period 10 -name default

# Configure synthesis
config_compile -pipeline_loops 64
config_schedule -enable_dsp_full_reg=false

# Run synthesis
csynth_design

# Create output directory
file mkdir hls_output

# Copy reports with consistent naming
if {[file exists "hls_design_output/solution1/syn/report/csynth.rpt"]} {
    file copy -force "hls_design_output/solution1/syn/report/csynth.rpt" "hls_imp_report_output/detect_and_recognize_csynth.rpt"
}

if {[file exists "hls_design_output/solution1/syn/report/csynth_design_size.rpt"]} {
    file copy -force "hls_design_output/solution1/syn/report/csynth_design_size.rpt" "hls_imp_report_output/detect_and_recognize_design_size.rpt"
}

# Export IP
export_design -format ip_catalog -rtl verilog -description "Combined Character Detection and Recognition IP" -vendor "user.org" -version "1.0"

# Close project
close_project