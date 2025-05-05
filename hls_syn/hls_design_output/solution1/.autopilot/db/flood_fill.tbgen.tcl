set moduleName flood_fill
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
set C_modelName {flood_fill}
set C_modelType { int 32 }
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
	{ frame_0 int 8 regular {bram 60000 { 1 3 } 1 1 }  }
	{ frame_1 int 8 regular {bram 60000 { 1 3 } 1 1 }  }
	{ frame_2 int 8 regular {bram 60000 { 1 3 } 1 1 }  }
	{ frame_3 int 8 regular {bram 60000 { 1 3 } 1 1 }  }
	{ frame_4 int 8 regular {bram 60000 { 1 3 } 1 1 }  }
	{ frame_5 int 8 regular {bram 60000 { 1 3 } 1 1 }  }
	{ frame_6 int 8 regular {bram 60000 { 1 3 } 1 1 }  }
	{ frame_7 int 8 regular {bram 60000 { 1 3 } 1 1 }  }
	{ start_x int 10 regular  }
	{ start_y int 10 regular  }
}
set hasAXIMCache 0
set l_AXIML2Cache [list]
set AXIMCacheInstDict [dict create]
set C_modelArgMapList {[ 
	{ "Name" : "frame_0", "interface" : "bram", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "frame_1", "interface" : "bram", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "frame_2", "interface" : "bram", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "frame_3", "interface" : "bram", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "frame_4", "interface" : "bram", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "frame_5", "interface" : "bram", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "frame_6", "interface" : "bram", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "frame_7", "interface" : "bram", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "start_x", "interface" : "wire", "bitwidth" : 10, "direction" : "READONLY"} , 
 	{ "Name" : "start_y", "interface" : "wire", "bitwidth" : 10, "direction" : "READONLY"} , 
 	{ "Name" : "ap_return", "interface" : "wire", "bitwidth" : 32} ]}
# RTL Port declarations: 
set portNum 49
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ frame_0_Addr_A sc_out sc_lv 32 signal 0 } 
	{ frame_0_EN_A sc_out sc_logic 1 signal 0 } 
	{ frame_0_WEN_A sc_out sc_lv 1 signal 0 } 
	{ frame_0_Din_A sc_out sc_lv 8 signal 0 } 
	{ frame_0_Dout_A sc_in sc_lv 8 signal 0 } 
	{ frame_1_Addr_A sc_out sc_lv 32 signal 1 } 
	{ frame_1_EN_A sc_out sc_logic 1 signal 1 } 
	{ frame_1_WEN_A sc_out sc_lv 1 signal 1 } 
	{ frame_1_Din_A sc_out sc_lv 8 signal 1 } 
	{ frame_1_Dout_A sc_in sc_lv 8 signal 1 } 
	{ frame_2_Addr_A sc_out sc_lv 32 signal 2 } 
	{ frame_2_EN_A sc_out sc_logic 1 signal 2 } 
	{ frame_2_WEN_A sc_out sc_lv 1 signal 2 } 
	{ frame_2_Din_A sc_out sc_lv 8 signal 2 } 
	{ frame_2_Dout_A sc_in sc_lv 8 signal 2 } 
	{ frame_3_Addr_A sc_out sc_lv 32 signal 3 } 
	{ frame_3_EN_A sc_out sc_logic 1 signal 3 } 
	{ frame_3_WEN_A sc_out sc_lv 1 signal 3 } 
	{ frame_3_Din_A sc_out sc_lv 8 signal 3 } 
	{ frame_3_Dout_A sc_in sc_lv 8 signal 3 } 
	{ frame_4_Addr_A sc_out sc_lv 32 signal 4 } 
	{ frame_4_EN_A sc_out sc_logic 1 signal 4 } 
	{ frame_4_WEN_A sc_out sc_lv 1 signal 4 } 
	{ frame_4_Din_A sc_out sc_lv 8 signal 4 } 
	{ frame_4_Dout_A sc_in sc_lv 8 signal 4 } 
	{ frame_5_Addr_A sc_out sc_lv 32 signal 5 } 
	{ frame_5_EN_A sc_out sc_logic 1 signal 5 } 
	{ frame_5_WEN_A sc_out sc_lv 1 signal 5 } 
	{ frame_5_Din_A sc_out sc_lv 8 signal 5 } 
	{ frame_5_Dout_A sc_in sc_lv 8 signal 5 } 
	{ frame_6_Addr_A sc_out sc_lv 32 signal 6 } 
	{ frame_6_EN_A sc_out sc_logic 1 signal 6 } 
	{ frame_6_WEN_A sc_out sc_lv 1 signal 6 } 
	{ frame_6_Din_A sc_out sc_lv 8 signal 6 } 
	{ frame_6_Dout_A sc_in sc_lv 8 signal 6 } 
	{ frame_7_Addr_A sc_out sc_lv 32 signal 7 } 
	{ frame_7_EN_A sc_out sc_logic 1 signal 7 } 
	{ frame_7_WEN_A sc_out sc_lv 1 signal 7 } 
	{ frame_7_Din_A sc_out sc_lv 8 signal 7 } 
	{ frame_7_Dout_A sc_in sc_lv 8 signal 7 } 
	{ start_x sc_in sc_lv 10 signal 8 } 
	{ start_y sc_in sc_lv 10 signal 9 } 
	{ ap_return sc_out sc_lv 32 signal -1 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
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
 	{ "name": "start_x", "direction": "in", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "start_x", "role": "default" }} , 
 	{ "name": "start_y", "direction": "in", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "start_y", "role": "default" }} , 
 	{ "name": "ap_return", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "ap_return", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "51", "52", "53", "54", "55", "56", "57", "58", "59", "60", "61", "62", "63", "64", "65", "66", "67", "68", "69", "71", "72", "73", "74", "75"],
		"CDFG" : "flood_fill",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "-1", "EstimateLatencyMax" : "-1",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "frame_0", "Type" : "Bram", "Direction" : "I"},
			{"Name" : "frame_1", "Type" : "Bram", "Direction" : "I"},
			{"Name" : "frame_2", "Type" : "Bram", "Direction" : "I"},
			{"Name" : "frame_3", "Type" : "Bram", "Direction" : "I"},
			{"Name" : "frame_4", "Type" : "Bram", "Direction" : "I"},
			{"Name" : "frame_5", "Type" : "Bram", "Direction" : "I"},
			{"Name" : "frame_6", "Type" : "Bram", "Direction" : "I"},
			{"Name" : "frame_7", "Type" : "Bram", "Direction" : "I"},
			{"Name" : "start_x", "Type" : "None", "Direction" : "I"},
			{"Name" : "start_y", "Type" : "None", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_117_4", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "89", "FirstState" : "ap_ST_fsm_state49", "LastState" : ["ap_ST_fsm_state89"], "QuitState" : ["ap_ST_fsm_state49"], "PreState" : ["ap_ST_fsm_state48"], "PostState" : ["ap_ST_fsm_state5"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "VITIS_LOOP_89_3", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "89", "FirstState" : "ap_ST_fsm_state5", "LastState" : ["ap_ST_fsm_state49"], "QuitState" : ["ap_ST_fsm_state5"], "PreState" : ["ap_ST_fsm_state4"], "PostState" : ["ap_ST_fsm_state1"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.visited_U", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.visited_1_U", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.visited_2_U", "Parent" : "0"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.visited_3_U", "Parent" : "0"},
	{"ID" : "5", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.visited_4_U", "Parent" : "0"},
	{"ID" : "6", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.visited_5_U", "Parent" : "0"},
	{"ID" : "7", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.visited_6_U", "Parent" : "0"},
	{"ID" : "8", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.visited_7_U", "Parent" : "0"},
	{"ID" : "9", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.visited_8_U", "Parent" : "0"},
	{"ID" : "10", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.visited_9_U", "Parent" : "0"},
	{"ID" : "11", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.visited_10_U", "Parent" : "0"},
	{"ID" : "12", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.visited_11_U", "Parent" : "0"},
	{"ID" : "13", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.visited_12_U", "Parent" : "0"},
	{"ID" : "14", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.visited_13_U", "Parent" : "0"},
	{"ID" : "15", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.visited_14_U", "Parent" : "0"},
	{"ID" : "16", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.visited_15_U", "Parent" : "0"},
	{"ID" : "17", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.visited_16_U", "Parent" : "0"},
	{"ID" : "18", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.visited_17_U", "Parent" : "0"},
	{"ID" : "19", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.visited_18_U", "Parent" : "0"},
	{"ID" : "20", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.visited_19_U", "Parent" : "0"},
	{"ID" : "21", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.visited_20_U", "Parent" : "0"},
	{"ID" : "22", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.visited_21_U", "Parent" : "0"},
	{"ID" : "23", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.visited_22_U", "Parent" : "0"},
	{"ID" : "24", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.visited_23_U", "Parent" : "0"},
	{"ID" : "25", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.visited_24_U", "Parent" : "0"},
	{"ID" : "26", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.visited_25_U", "Parent" : "0"},
	{"ID" : "27", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.visited_26_U", "Parent" : "0"},
	{"ID" : "28", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.visited_27_U", "Parent" : "0"},
	{"ID" : "29", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.visited_28_U", "Parent" : "0"},
	{"ID" : "30", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.visited_29_U", "Parent" : "0"},
	{"ID" : "31", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.visited_30_U", "Parent" : "0"},
	{"ID" : "32", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.visited_31_U", "Parent" : "0"},
	{"ID" : "33", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.visited_32_U", "Parent" : "0"},
	{"ID" : "34", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.visited_33_U", "Parent" : "0"},
	{"ID" : "35", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.visited_34_U", "Parent" : "0"},
	{"ID" : "36", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.visited_35_U", "Parent" : "0"},
	{"ID" : "37", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.visited_36_U", "Parent" : "0"},
	{"ID" : "38", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.visited_37_U", "Parent" : "0"},
	{"ID" : "39", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.visited_38_U", "Parent" : "0"},
	{"ID" : "40", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.visited_39_U", "Parent" : "0"},
	{"ID" : "41", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.visited_40_U", "Parent" : "0"},
	{"ID" : "42", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.visited_41_U", "Parent" : "0"},
	{"ID" : "43", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.visited_42_U", "Parent" : "0"},
	{"ID" : "44", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.visited_43_U", "Parent" : "0"},
	{"ID" : "45", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.visited_44_U", "Parent" : "0"},
	{"ID" : "46", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.visited_45_U", "Parent" : "0"},
	{"ID" : "47", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.visited_46_U", "Parent" : "0"},
	{"ID" : "48", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.visited_47_U", "Parent" : "0"},
	{"ID" : "49", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.visited_48_U", "Parent" : "0"},
	{"ID" : "50", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.visited_49_U", "Parent" : "0"},
	{"ID" : "51", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.visited_50_U", "Parent" : "0"},
	{"ID" : "52", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.visited_51_U", "Parent" : "0"},
	{"ID" : "53", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.visited_52_U", "Parent" : "0"},
	{"ID" : "54", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.visited_53_U", "Parent" : "0"},
	{"ID" : "55", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.visited_54_U", "Parent" : "0"},
	{"ID" : "56", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.visited_55_U", "Parent" : "0"},
	{"ID" : "57", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.visited_56_U", "Parent" : "0"},
	{"ID" : "58", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.visited_57_U", "Parent" : "0"},
	{"ID" : "59", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.visited_58_U", "Parent" : "0"},
	{"ID" : "60", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.visited_59_U", "Parent" : "0"},
	{"ID" : "61", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.visited_60_U", "Parent" : "0"},
	{"ID" : "62", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.visited_61_U", "Parent" : "0"},
	{"ID" : "63", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.visited_62_U", "Parent" : "0"},
	{"ID" : "64", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.visited_63_U", "Parent" : "0"},
	{"ID" : "65", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.queue_x_U", "Parent" : "0"},
	{"ID" : "66", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.queue_y_U", "Parent" : "0"},
	{"ID" : "67", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.neighbors_U", "Parent" : "0"},
	{"ID" : "68", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.neighbors_1_U", "Parent" : "0"},
	{"ID" : "69", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_flood_fill_Pipeline_VITIS_LOOP_59_1_fu_2412", "Parent" : "0", "Child" : ["70"],
		"CDFG" : "flood_fill_Pipeline_VITIS_LOOP_59_1",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "7502", "EstimateLatencyMax" : "7502",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "visited_63", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "visited_62", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "visited_61", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "visited_60", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "visited_59", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "visited_58", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "visited_57", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "visited_56", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "visited_55", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "visited_54", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "visited_53", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "visited_52", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "visited_51", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "visited_50", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "visited_49", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "visited_48", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "visited_47", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "visited_46", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "visited_45", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "visited_44", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "visited_43", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "visited_42", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "visited_41", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "visited_40", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "visited_39", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "visited_38", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "visited_37", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "visited_36", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "visited_35", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "visited_34", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "visited_33", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "visited_32", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "visited_31", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "visited_30", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "visited_29", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "visited_28", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "visited_27", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "visited_26", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "visited_25", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "visited_24", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "visited_23", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "visited_22", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "visited_21", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "visited_20", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "visited_19", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "visited_18", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "visited_17", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "visited_16", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "visited_15", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "visited_14", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "visited_13", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "visited_12", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "visited_11", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "visited_10", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "visited_9", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "visited_8", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "visited_7", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "visited_6", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "visited_5", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "visited_4", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "visited_3", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "visited_2", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "visited_1", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "visited", "Type" : "Memory", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_59_1", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_state1", "FirstStateIter" : "", "FirstStateBlock" : "ap_ST_fsm_state1_blk", "LastState" : "ap_ST_fsm_state1", "LastStateIter" : "", "LastStateBlock" : "ap_ST_fsm_state1_blk", "QuitState" : "ap_ST_fsm_state1", "QuitStateIter" : "", "QuitStateBlock" : "ap_ST_fsm_state1_blk", "OneDepthLoop" : "1", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "70", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_flood_fill_Pipeline_VITIS_LOOP_59_1_fu_2412.flow_control_loop_pipe_sequential_init_U", "Parent" : "69"},
	{"ID" : "71", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_32ns_34ns_42_2_1_U69", "Parent" : "0"},
	{"ID" : "72", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sparsemux_17_3_8_1_1_U70", "Parent" : "0"},
	{"ID" : "73", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.urem_32ns_8ns_16_36_1_U71", "Parent" : "0"},
	{"ID" : "74", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.urem_32ns_8ns_16_36_1_U72", "Parent" : "0"},
	{"ID" : "75", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sparsemux_129_6_1_1_1_U73", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	flood_fill {
		frame_0 {Type I LastRead 85 FirstWrite -1}
		frame_1 {Type I LastRead 85 FirstWrite -1}
		frame_2 {Type I LastRead 85 FirstWrite -1}
		frame_3 {Type I LastRead 85 FirstWrite -1}
		frame_4 {Type I LastRead 85 FirstWrite -1}
		frame_5 {Type I LastRead 85 FirstWrite -1}
		frame_6 {Type I LastRead 85 FirstWrite -1}
		frame_7 {Type I LastRead 85 FirstWrite -1}
		start_x {Type I LastRead 2 FirstWrite -1}
		start_y {Type I LastRead 2 FirstWrite -1}}
	flood_fill_Pipeline_VITIS_LOOP_59_1 {
		visited_63 {Type O LastRead -1 FirstWrite 0}
		visited_62 {Type O LastRead -1 FirstWrite 0}
		visited_61 {Type O LastRead -1 FirstWrite 0}
		visited_60 {Type O LastRead -1 FirstWrite 0}
		visited_59 {Type O LastRead -1 FirstWrite 0}
		visited_58 {Type O LastRead -1 FirstWrite 0}
		visited_57 {Type O LastRead -1 FirstWrite 0}
		visited_56 {Type O LastRead -1 FirstWrite 0}
		visited_55 {Type O LastRead -1 FirstWrite 0}
		visited_54 {Type O LastRead -1 FirstWrite 0}
		visited_53 {Type O LastRead -1 FirstWrite 0}
		visited_52 {Type O LastRead -1 FirstWrite 0}
		visited_51 {Type O LastRead -1 FirstWrite 0}
		visited_50 {Type O LastRead -1 FirstWrite 0}
		visited_49 {Type O LastRead -1 FirstWrite 0}
		visited_48 {Type O LastRead -1 FirstWrite 0}
		visited_47 {Type O LastRead -1 FirstWrite 0}
		visited_46 {Type O LastRead -1 FirstWrite 0}
		visited_45 {Type O LastRead -1 FirstWrite 0}
		visited_44 {Type O LastRead -1 FirstWrite 0}
		visited_43 {Type O LastRead -1 FirstWrite 0}
		visited_42 {Type O LastRead -1 FirstWrite 0}
		visited_41 {Type O LastRead -1 FirstWrite 0}
		visited_40 {Type O LastRead -1 FirstWrite 0}
		visited_39 {Type O LastRead -1 FirstWrite 0}
		visited_38 {Type O LastRead -1 FirstWrite 0}
		visited_37 {Type O LastRead -1 FirstWrite 0}
		visited_36 {Type O LastRead -1 FirstWrite 0}
		visited_35 {Type O LastRead -1 FirstWrite 0}
		visited_34 {Type O LastRead -1 FirstWrite 0}
		visited_33 {Type O LastRead -1 FirstWrite 0}
		visited_32 {Type O LastRead -1 FirstWrite 0}
		visited_31 {Type O LastRead -1 FirstWrite 0}
		visited_30 {Type O LastRead -1 FirstWrite 0}
		visited_29 {Type O LastRead -1 FirstWrite 0}
		visited_28 {Type O LastRead -1 FirstWrite 0}
		visited_27 {Type O LastRead -1 FirstWrite 0}
		visited_26 {Type O LastRead -1 FirstWrite 0}
		visited_25 {Type O LastRead -1 FirstWrite 0}
		visited_24 {Type O LastRead -1 FirstWrite 0}
		visited_23 {Type O LastRead -1 FirstWrite 0}
		visited_22 {Type O LastRead -1 FirstWrite 0}
		visited_21 {Type O LastRead -1 FirstWrite 0}
		visited_20 {Type O LastRead -1 FirstWrite 0}
		visited_19 {Type O LastRead -1 FirstWrite 0}
		visited_18 {Type O LastRead -1 FirstWrite 0}
		visited_17 {Type O LastRead -1 FirstWrite 0}
		visited_16 {Type O LastRead -1 FirstWrite 0}
		visited_15 {Type O LastRead -1 FirstWrite 0}
		visited_14 {Type O LastRead -1 FirstWrite 0}
		visited_13 {Type O LastRead -1 FirstWrite 0}
		visited_12 {Type O LastRead -1 FirstWrite 0}
		visited_11 {Type O LastRead -1 FirstWrite 0}
		visited_10 {Type O LastRead -1 FirstWrite 0}
		visited_9 {Type O LastRead -1 FirstWrite 0}
		visited_8 {Type O LastRead -1 FirstWrite 0}
		visited_7 {Type O LastRead -1 FirstWrite 0}
		visited_6 {Type O LastRead -1 FirstWrite 0}
		visited_5 {Type O LastRead -1 FirstWrite 0}
		visited_4 {Type O LastRead -1 FirstWrite 0}
		visited_3 {Type O LastRead -1 FirstWrite 0}
		visited_2 {Type O LastRead -1 FirstWrite 0}
		visited_1 {Type O LastRead -1 FirstWrite 0}
		visited {Type O LastRead -1 FirstWrite 0}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "-1", "Max" : "-1"}
	, {"Name" : "Interval", "Min" : "-1", "Max" : "-1"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	frame_0 { bram {  { frame_0_Addr_A MemPortADDR2 1 32 }  { frame_0_EN_A MemPortCE2 1 1 }  { frame_0_WEN_A MemPortWE2 1 1 }  { frame_0_Din_A MemPortDIN2 1 8 }  { frame_0_Dout_A MemPortDOUT2 0 8 } } }
	frame_1 { bram {  { frame_1_Addr_A MemPortADDR2 1 32 }  { frame_1_EN_A MemPortCE2 1 1 }  { frame_1_WEN_A MemPortWE2 1 1 }  { frame_1_Din_A MemPortDIN2 1 8 }  { frame_1_Dout_A MemPortDOUT2 0 8 } } }
	frame_2 { bram {  { frame_2_Addr_A MemPortADDR2 1 32 }  { frame_2_EN_A MemPortCE2 1 1 }  { frame_2_WEN_A MemPortWE2 1 1 }  { frame_2_Din_A MemPortDIN2 1 8 }  { frame_2_Dout_A MemPortDOUT2 0 8 } } }
	frame_3 { bram {  { frame_3_Addr_A MemPortADDR2 1 32 }  { frame_3_EN_A MemPortCE2 1 1 }  { frame_3_WEN_A MemPortWE2 1 1 }  { frame_3_Din_A MemPortDIN2 1 8 }  { frame_3_Dout_A MemPortDOUT2 0 8 } } }
	frame_4 { bram {  { frame_4_Addr_A MemPortADDR2 1 32 }  { frame_4_EN_A MemPortCE2 1 1 }  { frame_4_WEN_A MemPortWE2 1 1 }  { frame_4_Din_A MemPortDIN2 1 8 }  { frame_4_Dout_A MemPortDOUT2 0 8 } } }
	frame_5 { bram {  { frame_5_Addr_A MemPortADDR2 1 32 }  { frame_5_EN_A MemPortCE2 1 1 }  { frame_5_WEN_A MemPortWE2 1 1 }  { frame_5_Din_A MemPortDIN2 1 8 }  { frame_5_Dout_A MemPortDOUT2 0 8 } } }
	frame_6 { bram {  { frame_6_Addr_A MemPortADDR2 1 32 }  { frame_6_EN_A MemPortCE2 1 1 }  { frame_6_WEN_A MemPortWE2 1 1 }  { frame_6_Din_A MemPortDIN2 1 8 }  { frame_6_Dout_A MemPortDOUT2 0 8 } } }
	frame_7 { bram {  { frame_7_Addr_A MemPortADDR2 1 32 }  { frame_7_EN_A MemPortCE2 1 1 }  { frame_7_WEN_A MemPortWE2 1 1 }  { frame_7_Din_A MemPortDIN2 1 8 }  { frame_7_Dout_A MemPortDOUT2 0 8 } } }
	start_x { ap_none {  { start_x in_data 0 10 } } }
	start_y { ap_none {  { start_y in_data 0 10 } } }
}
