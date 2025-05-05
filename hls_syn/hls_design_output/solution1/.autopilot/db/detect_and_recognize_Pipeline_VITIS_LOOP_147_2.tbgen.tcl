set moduleName detect_and_recognize_Pipeline_VITIS_LOOP_147_2
set isTopModule 0
set isCombinational 0
set isDatapathOnly 0
set isPipelined 0
set pipeline_type none
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set hasInterrupt 0
set DLRegFirstOffset 0
set DLRegItemOffset 0
set svuvm_can_support 1
set cdfgNum 7
set C_modelName {detect_and_recognize_Pipeline_VITIS_LOOP_147_2}
set C_modelType { int 1 }
set ap_memory_interface_dict [dict create]
dict set ap_memory_interface_dict frame_0 { MEM_WIDTH 8 MEM_SIZE 60000 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE BYTE_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict frame_1 { MEM_WIDTH 8 MEM_SIZE 60000 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE BYTE_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict frame_2 { MEM_WIDTH 8 MEM_SIZE 60000 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE BYTE_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict frame_3 { MEM_WIDTH 8 MEM_SIZE 60000 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE BYTE_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict frame_4 { MEM_WIDTH 8 MEM_SIZE 60000 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE BYTE_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict frame_5 { MEM_WIDTH 8 MEM_SIZE 60000 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE BYTE_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict frame_6 { MEM_WIDTH 8 MEM_SIZE 60000 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE BYTE_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict frame_7 { MEM_WIDTH 8 MEM_SIZE 60000 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE BYTE_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
set C_modelArgList {
	{ phi_mul3 int 16 regular  }
	{ frame_0 int 8 regular {bram 60000 { 1 3 } 1 1 }  }
	{ frame_1 int 8 regular {bram 60000 { 1 3 } 1 1 }  }
	{ frame_2 int 8 regular {bram 60000 { 1 3 } 1 1 }  }
	{ frame_3 int 8 regular {bram 60000 { 1 3 } 1 1 }  }
	{ frame_4 int 8 regular {bram 60000 { 1 3 } 1 1 }  }
	{ frame_5 int 8 regular {bram 60000 { 1 3 } 1 1 }  }
	{ frame_6 int 8 regular {bram 60000 { 1 3 } 1 1 }  }
	{ frame_7 int 8 regular {bram 60000 { 1 3 } 1 1 }  }
	{ x_out int 10 regular {pointer 1}  }
}
set hasAXIMCache 0
set l_AXIML2Cache [list]
set AXIMCacheInstDict [dict create]
set C_modelArgMapList {[ 
	{ "Name" : "phi_mul3", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "frame_0", "interface" : "bram", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "frame_1", "interface" : "bram", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "frame_2", "interface" : "bram", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "frame_3", "interface" : "bram", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "frame_4", "interface" : "bram", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "frame_5", "interface" : "bram", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "frame_6", "interface" : "bram", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "frame_7", "interface" : "bram", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "x_out", "interface" : "wire", "bitwidth" : 10, "direction" : "WRITEONLY"} , 
 	{ "Name" : "ap_return", "interface" : "wire", "bitwidth" : 1} ]}
# RTL Port declarations: 
set portNum 50
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ phi_mul3 sc_in sc_lv 16 signal 0 } 
	{ frame_0_Addr_A sc_out sc_lv 32 signal 1 } 
	{ frame_0_EN_A sc_out sc_logic 1 signal 1 } 
	{ frame_0_WEN_A sc_out sc_lv 1 signal 1 } 
	{ frame_0_Din_A sc_out sc_lv 8 signal 1 } 
	{ frame_0_Dout_A sc_in sc_lv 8 signal 1 } 
	{ frame_1_Addr_A sc_out sc_lv 32 signal 2 } 
	{ frame_1_EN_A sc_out sc_logic 1 signal 2 } 
	{ frame_1_WEN_A sc_out sc_lv 1 signal 2 } 
	{ frame_1_Din_A sc_out sc_lv 8 signal 2 } 
	{ frame_1_Dout_A sc_in sc_lv 8 signal 2 } 
	{ frame_2_Addr_A sc_out sc_lv 32 signal 3 } 
	{ frame_2_EN_A sc_out sc_logic 1 signal 3 } 
	{ frame_2_WEN_A sc_out sc_lv 1 signal 3 } 
	{ frame_2_Din_A sc_out sc_lv 8 signal 3 } 
	{ frame_2_Dout_A sc_in sc_lv 8 signal 3 } 
	{ frame_3_Addr_A sc_out sc_lv 32 signal 4 } 
	{ frame_3_EN_A sc_out sc_logic 1 signal 4 } 
	{ frame_3_WEN_A sc_out sc_lv 1 signal 4 } 
	{ frame_3_Din_A sc_out sc_lv 8 signal 4 } 
	{ frame_3_Dout_A sc_in sc_lv 8 signal 4 } 
	{ frame_4_Addr_A sc_out sc_lv 32 signal 5 } 
	{ frame_4_EN_A sc_out sc_logic 1 signal 5 } 
	{ frame_4_WEN_A sc_out sc_lv 1 signal 5 } 
	{ frame_4_Din_A sc_out sc_lv 8 signal 5 } 
	{ frame_4_Dout_A sc_in sc_lv 8 signal 5 } 
	{ frame_5_Addr_A sc_out sc_lv 32 signal 6 } 
	{ frame_5_EN_A sc_out sc_logic 1 signal 6 } 
	{ frame_5_WEN_A sc_out sc_lv 1 signal 6 } 
	{ frame_5_Din_A sc_out sc_lv 8 signal 6 } 
	{ frame_5_Dout_A sc_in sc_lv 8 signal 6 } 
	{ frame_6_Addr_A sc_out sc_lv 32 signal 7 } 
	{ frame_6_EN_A sc_out sc_logic 1 signal 7 } 
	{ frame_6_WEN_A sc_out sc_lv 1 signal 7 } 
	{ frame_6_Din_A sc_out sc_lv 8 signal 7 } 
	{ frame_6_Dout_A sc_in sc_lv 8 signal 7 } 
	{ frame_7_Addr_A sc_out sc_lv 32 signal 8 } 
	{ frame_7_EN_A sc_out sc_logic 1 signal 8 } 
	{ frame_7_WEN_A sc_out sc_lv 1 signal 8 } 
	{ frame_7_Din_A sc_out sc_lv 8 signal 8 } 
	{ frame_7_Dout_A sc_in sc_lv 8 signal 8 } 
	{ x_out sc_out sc_lv 10 signal 9 } 
	{ x_out_ap_vld sc_out sc_logic 1 outvld 9 } 
	{ ap_return sc_out sc_lv 1 signal -1 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "phi_mul3", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "phi_mul3", "role": "default" }} , 
 	{ "name": "frame_0_Addr_A", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "frame_0", "role": "Addr_A" }} , 
 	{ "name": "frame_0_EN_A", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "frame_0", "role": "EN_A" }} , 
 	{ "name": "frame_0_WEN_A", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "frame_0", "role": "WEN_A" }} , 
 	{ "name": "frame_0_Din_A", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "frame_0", "role": "Din_A" }} , 
 	{ "name": "frame_0_Dout_A", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "frame_0", "role": "Dout_A" }} , 
 	{ "name": "frame_1_Addr_A", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "frame_1", "role": "Addr_A" }} , 
 	{ "name": "frame_1_EN_A", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "frame_1", "role": "EN_A" }} , 
 	{ "name": "frame_1_WEN_A", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "frame_1", "role": "WEN_A" }} , 
 	{ "name": "frame_1_Din_A", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "frame_1", "role": "Din_A" }} , 
 	{ "name": "frame_1_Dout_A", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "frame_1", "role": "Dout_A" }} , 
 	{ "name": "frame_2_Addr_A", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "frame_2", "role": "Addr_A" }} , 
 	{ "name": "frame_2_EN_A", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "frame_2", "role": "EN_A" }} , 
 	{ "name": "frame_2_WEN_A", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "frame_2", "role": "WEN_A" }} , 
 	{ "name": "frame_2_Din_A", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "frame_2", "role": "Din_A" }} , 
 	{ "name": "frame_2_Dout_A", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "frame_2", "role": "Dout_A" }} , 
 	{ "name": "frame_3_Addr_A", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "frame_3", "role": "Addr_A" }} , 
 	{ "name": "frame_3_EN_A", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "frame_3", "role": "EN_A" }} , 
 	{ "name": "frame_3_WEN_A", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "frame_3", "role": "WEN_A" }} , 
 	{ "name": "frame_3_Din_A", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "frame_3", "role": "Din_A" }} , 
 	{ "name": "frame_3_Dout_A", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "frame_3", "role": "Dout_A" }} , 
 	{ "name": "frame_4_Addr_A", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "frame_4", "role": "Addr_A" }} , 
 	{ "name": "frame_4_EN_A", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "frame_4", "role": "EN_A" }} , 
 	{ "name": "frame_4_WEN_A", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "frame_4", "role": "WEN_A" }} , 
 	{ "name": "frame_4_Din_A", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "frame_4", "role": "Din_A" }} , 
 	{ "name": "frame_4_Dout_A", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "frame_4", "role": "Dout_A" }} , 
 	{ "name": "frame_5_Addr_A", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "frame_5", "role": "Addr_A" }} , 
 	{ "name": "frame_5_EN_A", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "frame_5", "role": "EN_A" }} , 
 	{ "name": "frame_5_WEN_A", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "frame_5", "role": "WEN_A" }} , 
 	{ "name": "frame_5_Din_A", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "frame_5", "role": "Din_A" }} , 
 	{ "name": "frame_5_Dout_A", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "frame_5", "role": "Dout_A" }} , 
 	{ "name": "frame_6_Addr_A", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "frame_6", "role": "Addr_A" }} , 
 	{ "name": "frame_6_EN_A", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "frame_6", "role": "EN_A" }} , 
 	{ "name": "frame_6_WEN_A", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "frame_6", "role": "WEN_A" }} , 
 	{ "name": "frame_6_Din_A", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "frame_6", "role": "Din_A" }} , 
 	{ "name": "frame_6_Dout_A", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "frame_6", "role": "Dout_A" }} , 
 	{ "name": "frame_7_Addr_A", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "frame_7", "role": "Addr_A" }} , 
 	{ "name": "frame_7_EN_A", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "frame_7", "role": "EN_A" }} , 
 	{ "name": "frame_7_WEN_A", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "frame_7", "role": "WEN_A" }} , 
 	{ "name": "frame_7_Din_A", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "frame_7", "role": "Din_A" }} , 
 	{ "name": "frame_7_Dout_A", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "frame_7", "role": "Dout_A" }} , 
 	{ "name": "x_out", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "x_out", "role": "default" }} , 
 	{ "name": "x_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "x_out", "role": "ap_vld" }} , 
 	{ "name": "ap_return", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "ap_return", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1"],
		"CDFG" : "detect_and_recognize_Pipeline_VITIS_LOOP_147_2",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "4", "EstimateLatencyMax" : "2405",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "phi_mul3", "Type" : "None", "Direction" : "I"},
			{"Name" : "frame_0", "Type" : "Bram", "Direction" : "I"},
			{"Name" : "frame_1", "Type" : "Bram", "Direction" : "I"},
			{"Name" : "frame_2", "Type" : "Bram", "Direction" : "I"},
			{"Name" : "frame_3", "Type" : "Bram", "Direction" : "I"},
			{"Name" : "frame_4", "Type" : "Bram", "Direction" : "I"},
			{"Name" : "frame_5", "Type" : "Bram", "Direction" : "I"},
			{"Name" : "frame_6", "Type" : "Bram", "Direction" : "I"},
			{"Name" : "frame_7", "Type" : "Bram", "Direction" : "I"},
			{"Name" : "x_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_147_2", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "6", "FirstState" : "ap_ST_fsm_state2", "LastState" : ["ap_ST_fsm_state4"], "QuitState" : ["ap_ST_fsm_state4"], "PreState" : ["ap_ST_fsm_state1"], "PostState" : ["ap_ST_fsm_state5", "ap_ST_fsm_state6"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sparsemux_17_3_8_1_1_U1", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	detect_and_recognize_Pipeline_VITIS_LOOP_147_2 {
		phi_mul3 {Type I LastRead 0 FirstWrite -1}
		frame_0 {Type I LastRead 1 FirstWrite -1}
		frame_1 {Type I LastRead 1 FirstWrite -1}
		frame_2 {Type I LastRead 1 FirstWrite -1}
		frame_3 {Type I LastRead 1 FirstWrite -1}
		frame_4 {Type I LastRead 1 FirstWrite -1}
		frame_5 {Type I LastRead 1 FirstWrite -1}
		frame_6 {Type I LastRead 1 FirstWrite -1}
		frame_7 {Type I LastRead 1 FirstWrite -1}
		x_out {Type O LastRead -1 FirstWrite 2}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "4", "Max" : "2405"}
	, {"Name" : "Interval", "Min" : "4", "Max" : "2405"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	phi_mul3 { ap_none {  { phi_mul3 in_data 0 16 } } }
	frame_0 { bram {  { frame_0_Addr_A MemPortADDR2 1 32 }  { frame_0_EN_A MemPortCE2 1 1 }  { frame_0_WEN_A MemPortWE2 1 1 }  { frame_0_Din_A MemPortDIN2 1 8 }  { frame_0_Dout_A MemPortDOUT2 0 8 } } }
	frame_1 { bram {  { frame_1_Addr_A MemPortADDR2 1 32 }  { frame_1_EN_A MemPortCE2 1 1 }  { frame_1_WEN_A MemPortWE2 1 1 }  { frame_1_Din_A MemPortDIN2 1 8 }  { frame_1_Dout_A MemPortDOUT2 0 8 } } }
	frame_2 { bram {  { frame_2_Addr_A MemPortADDR2 1 32 }  { frame_2_EN_A MemPortCE2 1 1 }  { frame_2_WEN_A MemPortWE2 1 1 }  { frame_2_Din_A MemPortDIN2 1 8 }  { frame_2_Dout_A MemPortDOUT2 0 8 } } }
	frame_3 { bram {  { frame_3_Addr_A MemPortADDR2 1 32 }  { frame_3_EN_A MemPortCE2 1 1 }  { frame_3_WEN_A MemPortWE2 1 1 }  { frame_3_Din_A MemPortDIN2 1 8 }  { frame_3_Dout_A MemPortDOUT2 0 8 } } }
	frame_4 { bram {  { frame_4_Addr_A MemPortADDR2 1 32 }  { frame_4_EN_A MemPortCE2 1 1 }  { frame_4_WEN_A MemPortWE2 1 1 }  { frame_4_Din_A MemPortDIN2 1 8 }  { frame_4_Dout_A MemPortDOUT2 0 8 } } }
	frame_5 { bram {  { frame_5_Addr_A MemPortADDR2 1 32 }  { frame_5_EN_A MemPortCE2 1 1 }  { frame_5_WEN_A MemPortWE2 1 1 }  { frame_5_Din_A MemPortDIN2 1 8 }  { frame_5_Dout_A MemPortDOUT2 0 8 } } }
	frame_6 { bram {  { frame_6_Addr_A MemPortADDR2 1 32 }  { frame_6_EN_A MemPortCE2 1 1 }  { frame_6_WEN_A MemPortWE2 1 1 }  { frame_6_Din_A MemPortDIN2 1 8 }  { frame_6_Dout_A MemPortDOUT2 0 8 } } }
	frame_7 { bram {  { frame_7_Addr_A MemPortADDR2 1 32 }  { frame_7_EN_A MemPortCE2 1 1 }  { frame_7_WEN_A MemPortWE2 1 1 }  { frame_7_Din_A MemPortDIN2 1 8 }  { frame_7_Dout_A MemPortDOUT2 0 8 } } }
	x_out { ap_vld {  { x_out out_data 1 10 }  { x_out_ap_vld out_vld 1 1 } } }
}
