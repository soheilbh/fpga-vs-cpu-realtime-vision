set ModuleHierarchy {[{
"Name" : "detect_and_recognize","ID" : "0","Type" : "sequential",
"SubInsts" : [
	{"Name" : "grp_recognize_character_fu_166","ID" : "1","Type" : "sequential",
		"SubLoops" : [
		{"Name" : "VITIS_LOOP_9_1","ID" : "2","Type" : "no"},]},],
"SubLoops" : [
	{"Name" : "VITIS_LOOP_146_1","ID" : "3","Type" : "no",
	"SubInsts" : [
	{"Name" : "grp_detect_and_recognize_Pipeline_VITIS_LOOP_147_2_fu_122","ID" : "4","Type" : "sequential",
			"SubLoops" : [
			{"Name" : "VITIS_LOOP_147_2","ID" : "5","Type" : "pipeline"},]},
	{"Name" : "grp_flood_fill_fu_144","ID" : "6","Type" : "sequential",
			"SubInsts" : [
			{"Name" : "grp_flood_fill_Pipeline_VITIS_LOOP_59_1_fu_2412","ID" : "7","Type" : "sequential",
				"SubLoops" : [
				{"Name" : "VITIS_LOOP_59_1","ID" : "8","Type" : "pipeline"},]},],
			"SubLoops" : [
			{"Name" : "VITIS_LOOP_89_3","ID" : "9","Type" : "no",
			"SubLoops" : [
			{"Name" : "VITIS_LOOP_117_4","ID" : "10","Type" : "no"},]},]},]},]
}]}