# ==============================================================
# Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2024.2 (64-bit)
# Tool Version Limit: 2024.11
# Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
# Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
# 
# ==============================================================
source -notrace "/tools/Xilinx/Vitis/2024.2/common/scripts/ipxhls.tcl"
set ip_dir "/home/soheil/Desktop/mac_shared/fpga-vs-cpu-realtime-vision/hls_syn/hls_design_output/solution1/impl/ip"
set data_file "/home/soheil/Desktop/mac_shared/fpga-vs-cpu-realtime-vision/hls_syn/hls_design_output/solution1/solution1_data.json"
set ip_types "vitis sysgen"
if { [catch {::ipx::utils::package_hls_ip $ip_dir $data_file $ip_types } res] } {
  puts "Caught error:\n$::errorInfo"
  error $res
}
