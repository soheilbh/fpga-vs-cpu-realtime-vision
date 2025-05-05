set SynModuleInfo {
  {SRCNAME detect_and_recognize_Pipeline_VITIS_LOOP_147_2 MODELNAME detect_and_recognize_Pipeline_VITIS_LOOP_147_2 RTLNAME detect_and_recognize_detect_and_recognize_Pipeline_VITIS_LOOP_147_2
    SUBMODULES {
      {MODELNAME detect_and_recognize_sparsemux_17_3_8_1_1 RTLNAME detect_and_recognize_sparsemux_17_3_8_1_1 BINDTYPE op TYPE sparsemux IMPL compactencoding_dontcare}
    }
  }
  {SRCNAME flood_fill_Pipeline_VITIS_LOOP_59_1 MODELNAME flood_fill_Pipeline_VITIS_LOOP_59_1 RTLNAME detect_and_recognize_flood_fill_Pipeline_VITIS_LOOP_59_1
    SUBMODULES {
      {MODELNAME detect_and_recognize_flow_control_loop_pipe_sequential_init RTLNAME detect_and_recognize_flow_control_loop_pipe_sequential_init BINDTYPE interface TYPE internal_upc_flow_control INSTNAME detect_and_recognize_flow_control_loop_pipe_sequential_init_U}
    }
  }
  {SRCNAME flood_fill MODELNAME flood_fill RTLNAME detect_and_recognize_flood_fill
    SUBMODULES {
      {MODELNAME detect_and_recognize_mul_32ns_34ns_42_2_1 RTLNAME detect_and_recognize_mul_32ns_34ns_42_2_1 BINDTYPE op TYPE mul IMPL auto LATENCY 1 ALLOW_PRAGMA 1}
      {MODELNAME detect_and_recognize_urem_32ns_8ns_16_36_1 RTLNAME detect_and_recognize_urem_32ns_8ns_16_36_1 BINDTYPE op TYPE urem IMPL auto LATENCY 35 ALLOW_PRAGMA 1}
      {MODELNAME detect_and_recognize_sparsemux_129_6_1_1_1 RTLNAME detect_and_recognize_sparsemux_129_6_1_1_1 BINDTYPE op TYPE sparsemux IMPL compactencoding_dontcare}
      {MODELNAME detect_and_recognize_flood_fill_visited_RAM_2P_LUTRAM_1R1W RTLNAME detect_and_recognize_flood_fill_visited_RAM_2P_LUTRAM_1R1W BINDTYPE storage TYPE ram_2p IMPL lutram LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME detect_and_recognize_flood_fill_queue_x_RAM_AUTO_1R1W RTLNAME detect_and_recognize_flood_fill_queue_x_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME detect_and_recognize_flood_fill_neighbors_RAM_AUTO_1R1W RTLNAME detect_and_recognize_flood_fill_neighbors_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME recognize_character MODELNAME recognize_character RTLNAME detect_and_recognize_recognize_character
    SUBMODULES {
      {MODELNAME detect_and_recognize_recognize_character_char_prefix_sums_ROM_AUTO_1R RTLNAME detect_and_recognize_recognize_character_char_prefix_sums_ROM_AUTO_1R BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME detect_and_recognize_recognize_character_prefix_sum_to_char_ROM_AUTO_1R RTLNAME detect_and_recognize_recognize_character_prefix_sum_to_char_ROM_AUTO_1R BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME detect_and_recognize MODELNAME detect_and_recognize RTLNAME detect_and_recognize IS_TOP 1
    SUBMODULES {
      {MODELNAME detect_and_recognize_control_s_axi RTLNAME detect_and_recognize_control_s_axi BINDTYPE interface TYPE interface_s_axilite}
    }
  }
}
