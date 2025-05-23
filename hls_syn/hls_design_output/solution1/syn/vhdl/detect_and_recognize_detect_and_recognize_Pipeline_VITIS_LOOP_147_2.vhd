-- ==============================================================
-- Generated by Vitis HLS v2024.2
-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
-- ==============================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity detect_and_recognize_detect_and_recognize_Pipeline_VITIS_LOOP_147_2 is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    phi_mul3 : IN STD_LOGIC_VECTOR (15 downto 0);
    frame_0_Addr_A : OUT STD_LOGIC_VECTOR (31 downto 0);
    frame_0_EN_A : OUT STD_LOGIC;
    frame_0_WEN_A : OUT STD_LOGIC_VECTOR (0 downto 0);
    frame_0_Din_A : OUT STD_LOGIC_VECTOR (7 downto 0);
    frame_0_Dout_A : IN STD_LOGIC_VECTOR (7 downto 0);
    frame_1_Addr_A : OUT STD_LOGIC_VECTOR (31 downto 0);
    frame_1_EN_A : OUT STD_LOGIC;
    frame_1_WEN_A : OUT STD_LOGIC_VECTOR (0 downto 0);
    frame_1_Din_A : OUT STD_LOGIC_VECTOR (7 downto 0);
    frame_1_Dout_A : IN STD_LOGIC_VECTOR (7 downto 0);
    frame_2_Addr_A : OUT STD_LOGIC_VECTOR (31 downto 0);
    frame_2_EN_A : OUT STD_LOGIC;
    frame_2_WEN_A : OUT STD_LOGIC_VECTOR (0 downto 0);
    frame_2_Din_A : OUT STD_LOGIC_VECTOR (7 downto 0);
    frame_2_Dout_A : IN STD_LOGIC_VECTOR (7 downto 0);
    frame_3_Addr_A : OUT STD_LOGIC_VECTOR (31 downto 0);
    frame_3_EN_A : OUT STD_LOGIC;
    frame_3_WEN_A : OUT STD_LOGIC_VECTOR (0 downto 0);
    frame_3_Din_A : OUT STD_LOGIC_VECTOR (7 downto 0);
    frame_3_Dout_A : IN STD_LOGIC_VECTOR (7 downto 0);
    frame_4_Addr_A : OUT STD_LOGIC_VECTOR (31 downto 0);
    frame_4_EN_A : OUT STD_LOGIC;
    frame_4_WEN_A : OUT STD_LOGIC_VECTOR (0 downto 0);
    frame_4_Din_A : OUT STD_LOGIC_VECTOR (7 downto 0);
    frame_4_Dout_A : IN STD_LOGIC_VECTOR (7 downto 0);
    frame_5_Addr_A : OUT STD_LOGIC_VECTOR (31 downto 0);
    frame_5_EN_A : OUT STD_LOGIC;
    frame_5_WEN_A : OUT STD_LOGIC_VECTOR (0 downto 0);
    frame_5_Din_A : OUT STD_LOGIC_VECTOR (7 downto 0);
    frame_5_Dout_A : IN STD_LOGIC_VECTOR (7 downto 0);
    frame_6_Addr_A : OUT STD_LOGIC_VECTOR (31 downto 0);
    frame_6_EN_A : OUT STD_LOGIC;
    frame_6_WEN_A : OUT STD_LOGIC_VECTOR (0 downto 0);
    frame_6_Din_A : OUT STD_LOGIC_VECTOR (7 downto 0);
    frame_6_Dout_A : IN STD_LOGIC_VECTOR (7 downto 0);
    frame_7_Addr_A : OUT STD_LOGIC_VECTOR (31 downto 0);
    frame_7_EN_A : OUT STD_LOGIC;
    frame_7_WEN_A : OUT STD_LOGIC_VECTOR (0 downto 0);
    frame_7_Din_A : OUT STD_LOGIC_VECTOR (7 downto 0);
    frame_7_Dout_A : IN STD_LOGIC_VECTOR (7 downto 0);
    x_out : OUT STD_LOGIC_VECTOR (9 downto 0);
    x_out_ap_vld : OUT STD_LOGIC;
    ap_return : OUT STD_LOGIC_VECTOR (0 downto 0) );
end;


architecture behav of detect_and_recognize_detect_and_recognize_Pipeline_VITIS_LOOP_147_2 is 
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_state1 : STD_LOGIC_VECTOR (5 downto 0) := "000001";
    constant ap_ST_fsm_state2 : STD_LOGIC_VECTOR (5 downto 0) := "000010";
    constant ap_ST_fsm_state3 : STD_LOGIC_VECTOR (5 downto 0) := "000100";
    constant ap_ST_fsm_state4 : STD_LOGIC_VECTOR (5 downto 0) := "001000";
    constant ap_ST_fsm_state5 : STD_LOGIC_VECTOR (5 downto 0) := "010000";
    constant ap_ST_fsm_state6 : STD_LOGIC_VECTOR (5 downto 0) := "100000";
    constant ap_const_boolean_1 : BOOLEAN := true;
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_lv32_1 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000001";
    constant ap_const_lv32_2 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000010";
    constant ap_const_lv1_1 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv32_5 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000101";
    constant ap_const_lv1_0 : STD_LOGIC_VECTOR (0 downto 0) := "0";
    constant ap_const_lv32_4 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000100";
    constant ap_const_lv10_0 : STD_LOGIC_VECTOR (9 downto 0) := "0000000000";
    constant ap_const_lv32_3 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000011";
    constant ap_const_lv21_0 : STD_LOGIC_VECTOR (20 downto 0) := "000000000000000000000";
    constant ap_const_lv10_320 : STD_LOGIC_VECTOR (9 downto 0) := "1100100000";
    constant ap_const_lv10_1 : STD_LOGIC_VECTOR (9 downto 0) := "0000000001";
    constant ap_const_lv32_11 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000010001";
    constant ap_const_lv32_13 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000010011";
    constant ap_const_lv21_51F : STD_LOGIC_VECTOR (20 downto 0) := "000000000010100011111";
    constant ap_const_lv8_A0 : STD_LOGIC_VECTOR (7 downto 0) := "10100000";
    constant ap_const_lv10_63 : STD_LOGIC_VECTOR (9 downto 0) := "0001100011";
    constant ap_const_lv8_0 : STD_LOGIC_VECTOR (7 downto 0) := "00000000";

attribute shreg_extract : string;
    signal ap_CS_fsm : STD_LOGIC_VECTOR (5 downto 0) := "000001";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_CS_fsm_state1 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state1 : signal is "none";
    signal phi_urem_load_reg_411 : STD_LOGIC_VECTOR (9 downto 0);
    signal ap_CS_fsm_state2 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state2 : signal is "none";
    signal x_1_reg_417 : STD_LOGIC_VECTOR (9 downto 0);
    signal icmp_ln147_fu_257_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln147_reg_422 : STD_LOGIC_VECTOR (0 downto 0);
    signal add_ln147_fu_263_p2 : STD_LOGIC_VECTOR (9 downto 0);
    signal add_ln147_reg_426 : STD_LOGIC_VECTOR (9 downto 0);
    signal phi_mul_load_reg_471 : STD_LOGIC_VECTOR (20 downto 0);
    signal ap_CS_fsm_state3 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state3 : signal is "none";
    signal pixel_fu_303_p19 : STD_LOGIC_VECTOR (7 downto 0);
    signal pixel_reg_476 : STD_LOGIC_VECTOR (7 downto 0);
    signal ap_phi_mux_UnifiedRetVal_phi_fu_228_p4 : STD_LOGIC_VECTOR (0 downto 0);
    signal UnifiedRetVal_reg_224 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_CS_fsm_state6 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state6 : signal is "none";
    signal ap_CS_fsm_state5 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state5 : signal is "none";
    signal zext_ln148_1_fu_278_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal phi_urem_fu_94 : STD_LOGIC_VECTOR (9 downto 0) := "0000000000";
    signal select_ln147_fu_363_p3 : STD_LOGIC_VECTOR (9 downto 0);
    signal ap_CS_fsm_state4 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state4 : signal is "none";
    signal icmp_ln7_fu_348_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal phi_mul_fu_98 : STD_LOGIC_VECTOR (20 downto 0) := "000000000000000000000";
    signal add_ln147_1_fu_343_p2 : STD_LOGIC_VECTOR (20 downto 0);
    signal x_fu_102 : STD_LOGIC_VECTOR (9 downto 0) := "0000000000";
    signal frame_0_EN_A_local : STD_LOGIC;
    signal frame_0_Addr_A_local : STD_LOGIC_VECTOR (31 downto 0);
    signal frame_0_Addr_A_orig : STD_LOGIC_VECTOR (31 downto 0);
    signal frame_1_EN_A_local : STD_LOGIC;
    signal frame_1_Addr_A_local : STD_LOGIC_VECTOR (31 downto 0);
    signal frame_1_Addr_A_orig : STD_LOGIC_VECTOR (31 downto 0);
    signal frame_2_EN_A_local : STD_LOGIC;
    signal frame_2_Addr_A_local : STD_LOGIC_VECTOR (31 downto 0);
    signal frame_2_Addr_A_orig : STD_LOGIC_VECTOR (31 downto 0);
    signal frame_3_EN_A_local : STD_LOGIC;
    signal frame_3_Addr_A_local : STD_LOGIC_VECTOR (31 downto 0);
    signal frame_3_Addr_A_orig : STD_LOGIC_VECTOR (31 downto 0);
    signal frame_4_EN_A_local : STD_LOGIC;
    signal frame_4_Addr_A_local : STD_LOGIC_VECTOR (31 downto 0);
    signal frame_4_Addr_A_orig : STD_LOGIC_VECTOR (31 downto 0);
    signal frame_5_EN_A_local : STD_LOGIC;
    signal frame_5_Addr_A_local : STD_LOGIC_VECTOR (31 downto 0);
    signal frame_5_Addr_A_orig : STD_LOGIC_VECTOR (31 downto 0);
    signal frame_6_EN_A_local : STD_LOGIC;
    signal frame_6_Addr_A_local : STD_LOGIC_VECTOR (31 downto 0);
    signal frame_6_Addr_A_orig : STD_LOGIC_VECTOR (31 downto 0);
    signal frame_7_EN_A_local : STD_LOGIC;
    signal frame_7_Addr_A_local : STD_LOGIC_VECTOR (31 downto 0);
    signal frame_7_Addr_A_orig : STD_LOGIC_VECTOR (31 downto 0);
    signal zext_ln148_fu_269_p1 : STD_LOGIC_VECTOR (15 downto 0);
    signal add_ln148_fu_273_p2 : STD_LOGIC_VECTOR (15 downto 0);
    signal pixel_fu_303_p17 : STD_LOGIC_VECTOR (7 downto 0);
    signal pixel_fu_303_p18 : STD_LOGIC_VECTOR (2 downto 0);
    signal icmp_ln147_1_fu_358_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal add_ln147_2_fu_353_p2 : STD_LOGIC_VECTOR (9 downto 0);
    signal ap_return_preg : STD_LOGIC_VECTOR (0 downto 0) := "0";
    signal ap_NS_fsm : STD_LOGIC_VECTOR (5 downto 0);
    signal ap_ST_fsm_state1_blk : STD_LOGIC;
    signal ap_ST_fsm_state2_blk : STD_LOGIC;
    signal ap_ST_fsm_state3_blk : STD_LOGIC;
    signal ap_ST_fsm_state4_blk : STD_LOGIC;
    signal ap_ST_fsm_state5_blk : STD_LOGIC;
    signal ap_ST_fsm_state6_blk : STD_LOGIC;
    signal pixel_fu_303_p1 : STD_LOGIC_VECTOR (2 downto 0);
    signal pixel_fu_303_p3 : STD_LOGIC_VECTOR (2 downto 0);
    signal pixel_fu_303_p5 : STD_LOGIC_VECTOR (2 downto 0);
    signal pixel_fu_303_p7 : STD_LOGIC_VECTOR (2 downto 0);
    signal pixel_fu_303_p9 : STD_LOGIC_VECTOR (2 downto 0);
    signal pixel_fu_303_p11 : STD_LOGIC_VECTOR (2 downto 0);
    signal pixel_fu_303_p13 : STD_LOGIC_VECTOR (2 downto 0);
    signal pixel_fu_303_p15 : STD_LOGIC_VECTOR (2 downto 0);
    signal ap_ce_reg : STD_LOGIC;

    component detect_and_recognize_sparsemux_17_3_8_1_1 IS
    generic (
        ID : INTEGER;
        NUM_STAGE : INTEGER;
        CASE0 : STD_LOGIC_VECTOR (2 downto 0);
        din0_WIDTH : INTEGER;
        CASE1 : STD_LOGIC_VECTOR (2 downto 0);
        din1_WIDTH : INTEGER;
        CASE2 : STD_LOGIC_VECTOR (2 downto 0);
        din2_WIDTH : INTEGER;
        CASE3 : STD_LOGIC_VECTOR (2 downto 0);
        din3_WIDTH : INTEGER;
        CASE4 : STD_LOGIC_VECTOR (2 downto 0);
        din4_WIDTH : INTEGER;
        CASE5 : STD_LOGIC_VECTOR (2 downto 0);
        din5_WIDTH : INTEGER;
        CASE6 : STD_LOGIC_VECTOR (2 downto 0);
        din6_WIDTH : INTEGER;
        CASE7 : STD_LOGIC_VECTOR (2 downto 0);
        din7_WIDTH : INTEGER;
        def_WIDTH : INTEGER;
        sel_WIDTH : INTEGER;
        dout_WIDTH : INTEGER );
    port (
        din0 : IN STD_LOGIC_VECTOR (7 downto 0);
        din1 : IN STD_LOGIC_VECTOR (7 downto 0);
        din2 : IN STD_LOGIC_VECTOR (7 downto 0);
        din3 : IN STD_LOGIC_VECTOR (7 downto 0);
        din4 : IN STD_LOGIC_VECTOR (7 downto 0);
        din5 : IN STD_LOGIC_VECTOR (7 downto 0);
        din6 : IN STD_LOGIC_VECTOR (7 downto 0);
        din7 : IN STD_LOGIC_VECTOR (7 downto 0);
        def : IN STD_LOGIC_VECTOR (7 downto 0);
        sel : IN STD_LOGIC_VECTOR (2 downto 0);
        dout : OUT STD_LOGIC_VECTOR (7 downto 0) );
    end component;



begin
    sparsemux_17_3_8_1_1_U1 : component detect_and_recognize_sparsemux_17_3_8_1_1
    generic map (
        ID => 1,
        NUM_STAGE => 1,
        CASE0 => "000",
        din0_WIDTH => 8,
        CASE1 => "001",
        din1_WIDTH => 8,
        CASE2 => "010",
        din2_WIDTH => 8,
        CASE3 => "011",
        din3_WIDTH => 8,
        CASE4 => "100",
        din4_WIDTH => 8,
        CASE5 => "101",
        din5_WIDTH => 8,
        CASE6 => "110",
        din6_WIDTH => 8,
        CASE7 => "111",
        din7_WIDTH => 8,
        def_WIDTH => 8,
        sel_WIDTH => 3,
        dout_WIDTH => 8)
    port map (
        din0 => frame_0_Dout_A,
        din1 => frame_1_Dout_A,
        din2 => frame_2_Dout_A,
        din3 => frame_3_Dout_A,
        din4 => frame_4_Dout_A,
        din5 => frame_5_Dout_A,
        din6 => frame_6_Dout_A,
        din7 => frame_7_Dout_A,
        def => pixel_fu_303_p17,
        sel => pixel_fu_303_p18,
        dout => pixel_fu_303_p19);





    ap_CS_fsm_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_CS_fsm <= ap_ST_fsm_state1;
            else
                ap_CS_fsm <= ap_NS_fsm;
            end if;
        end if;
    end process;


    ap_return_preg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_return_preg <= ap_const_lv1_0;
            else
                if ((ap_const_logic_1 = ap_CS_fsm_state5)) then 
                    ap_return_preg <= ap_phi_mux_UnifiedRetVal_phi_fu_228_p4;
                end if; 
            end if;
        end if;
    end process;


    UnifiedRetVal_reg_224_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_CS_fsm_state5) and (icmp_ln147_reg_422 = ap_const_lv1_0))) then 
                UnifiedRetVal_reg_224 <= ap_const_lv1_0;
            elsif ((ap_const_logic_1 = ap_CS_fsm_state6)) then 
                UnifiedRetVal_reg_224 <= ap_const_lv1_1;
            end if; 
        end if;
    end process;

    phi_mul_fu_98_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start = ap_const_logic_1))) then 
                phi_mul_fu_98 <= ap_const_lv21_0;
            elsif (((ap_const_logic_1 = ap_CS_fsm_state4) and (icmp_ln7_fu_348_p2 = ap_const_lv1_0) and (icmp_ln147_reg_422 = ap_const_lv1_0))) then 
                phi_mul_fu_98 <= add_ln147_1_fu_343_p2;
            end if; 
        end if;
    end process;

    phi_urem_fu_94_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start = ap_const_logic_1))) then 
                phi_urem_fu_94 <= ap_const_lv10_0;
            elsif (((ap_const_logic_1 = ap_CS_fsm_state4) and (icmp_ln7_fu_348_p2 = ap_const_lv1_0) and (icmp_ln147_reg_422 = ap_const_lv1_0))) then 
                phi_urem_fu_94 <= select_ln147_fu_363_p3;
            end if; 
        end if;
    end process;

    x_fu_102_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start = ap_const_logic_1))) then 
                x_fu_102 <= ap_const_lv10_0;
            elsif (((ap_const_logic_1 = ap_CS_fsm_state4) and (icmp_ln7_fu_348_p2 = ap_const_lv1_0) and (icmp_ln147_reg_422 = ap_const_lv1_0))) then 
                x_fu_102 <= add_ln147_reg_426;
            end if; 
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state2)) then
                add_ln147_reg_426 <= add_ln147_fu_263_p2;
                icmp_ln147_reg_422 <= icmp_ln147_fu_257_p2;
                phi_urem_load_reg_411 <= phi_urem_fu_94;
                x_1_reg_417 <= x_fu_102;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state3)) then
                phi_mul_load_reg_471 <= phi_mul_fu_98;
                pixel_reg_476 <= pixel_fu_303_p19;
            end if;
        end if;
    end process;

    ap_NS_fsm_assign_proc : process (ap_start, ap_CS_fsm, ap_CS_fsm_state1, icmp_ln147_reg_422, ap_CS_fsm_state4, icmp_ln7_fu_348_p2)
    begin
        case ap_CS_fsm is
            when ap_ST_fsm_state1 => 
                if (((ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start = ap_const_logic_1))) then
                    ap_NS_fsm <= ap_ST_fsm_state2;
                else
                    ap_NS_fsm <= ap_ST_fsm_state1;
                end if;
            when ap_ST_fsm_state2 => 
                ap_NS_fsm <= ap_ST_fsm_state3;
            when ap_ST_fsm_state3 => 
                ap_NS_fsm <= ap_ST_fsm_state4;
            when ap_ST_fsm_state4 => 
                if (((ap_const_logic_1 = ap_CS_fsm_state4) and (icmp_ln7_fu_348_p2 = ap_const_lv1_0) and (icmp_ln147_reg_422 = ap_const_lv1_0))) then
                    ap_NS_fsm <= ap_ST_fsm_state2;
                elsif (((ap_const_logic_1 = ap_CS_fsm_state4) and (icmp_ln147_reg_422 = ap_const_lv1_1))) then
                    ap_NS_fsm <= ap_ST_fsm_state6;
                else
                    ap_NS_fsm <= ap_ST_fsm_state5;
                end if;
            when ap_ST_fsm_state5 => 
                ap_NS_fsm <= ap_ST_fsm_state1;
            when ap_ST_fsm_state6 => 
                ap_NS_fsm <= ap_ST_fsm_state5;
            when others =>  
                ap_NS_fsm <= "XXXXXX";
        end case;
    end process;
    add_ln147_1_fu_343_p2 <= std_logic_vector(unsigned(phi_mul_load_reg_471) + unsigned(ap_const_lv21_51F));
    add_ln147_2_fu_353_p2 <= std_logic_vector(unsigned(phi_urem_load_reg_411) + unsigned(ap_const_lv10_1));
    add_ln147_fu_263_p2 <= std_logic_vector(unsigned(x_fu_102) + unsigned(ap_const_lv10_1));
    add_ln148_fu_273_p2 <= std_logic_vector(unsigned(phi_mul3) + unsigned(zext_ln148_fu_269_p1));
    ap_CS_fsm_state1 <= ap_CS_fsm(0);
    ap_CS_fsm_state2 <= ap_CS_fsm(1);
    ap_CS_fsm_state3 <= ap_CS_fsm(2);
    ap_CS_fsm_state4 <= ap_CS_fsm(3);
    ap_CS_fsm_state5 <= ap_CS_fsm(4);
    ap_CS_fsm_state6 <= ap_CS_fsm(5);

    ap_ST_fsm_state1_blk_assign_proc : process(ap_start)
    begin
        if ((ap_start = ap_const_logic_0)) then 
            ap_ST_fsm_state1_blk <= ap_const_logic_1;
        else 
            ap_ST_fsm_state1_blk <= ap_const_logic_0;
        end if; 
    end process;

    ap_ST_fsm_state2_blk <= ap_const_logic_0;
    ap_ST_fsm_state3_blk <= ap_const_logic_0;
    ap_ST_fsm_state4_blk <= ap_const_logic_0;
    ap_ST_fsm_state5_blk <= ap_const_logic_0;
    ap_ST_fsm_state6_blk <= ap_const_logic_0;

    ap_done_assign_proc : process(ap_start, ap_CS_fsm_state1, ap_CS_fsm_state5)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state5) or ((ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start = ap_const_logic_0)))) then 
            ap_done <= ap_const_logic_1;
        else 
            ap_done <= ap_const_logic_0;
        end if; 
    end process;


    ap_idle_assign_proc : process(ap_start, ap_CS_fsm_state1)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start = ap_const_logic_0))) then 
            ap_idle <= ap_const_logic_1;
        else 
            ap_idle <= ap_const_logic_0;
        end if; 
    end process;


    ap_phi_mux_UnifiedRetVal_phi_fu_228_p4_assign_proc : process(icmp_ln147_reg_422, UnifiedRetVal_reg_224, ap_CS_fsm_state5)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state5) and (icmp_ln147_reg_422 = ap_const_lv1_0))) then 
            ap_phi_mux_UnifiedRetVal_phi_fu_228_p4 <= ap_const_lv1_0;
        else 
            ap_phi_mux_UnifiedRetVal_phi_fu_228_p4 <= UnifiedRetVal_reg_224;
        end if; 
    end process;


    ap_ready_assign_proc : process(ap_CS_fsm_state5)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state5)) then 
            ap_ready <= ap_const_logic_1;
        else 
            ap_ready <= ap_const_logic_0;
        end if; 
    end process;


    ap_return_assign_proc : process(ap_phi_mux_UnifiedRetVal_phi_fu_228_p4, ap_CS_fsm_state5, ap_return_preg)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state5)) then 
            ap_return <= ap_phi_mux_UnifiedRetVal_phi_fu_228_p4;
        else 
            ap_return <= ap_return_preg;
        end if; 
    end process;

    frame_0_Addr_A <= frame_0_Addr_A_local;
    frame_0_Addr_A_local <= std_logic_vector(shift_left(unsigned(frame_0_Addr_A_orig),to_integer(unsigned('0' & ap_const_lv32_0(31-1 downto 0)))));
    frame_0_Addr_A_orig <= zext_ln148_1_fu_278_p1(32 - 1 downto 0);
    frame_0_Din_A <= ap_const_lv8_0;
    frame_0_EN_A <= frame_0_EN_A_local;

    frame_0_EN_A_local_assign_proc : process(ap_CS_fsm_state2)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state2)) then 
            frame_0_EN_A_local <= ap_const_logic_1;
        else 
            frame_0_EN_A_local <= ap_const_logic_0;
        end if; 
    end process;

    frame_0_WEN_A <= ap_const_lv1_0;
    frame_1_Addr_A <= frame_1_Addr_A_local;
    frame_1_Addr_A_local <= std_logic_vector(shift_left(unsigned(frame_1_Addr_A_orig),to_integer(unsigned('0' & ap_const_lv32_0(31-1 downto 0)))));
    frame_1_Addr_A_orig <= zext_ln148_1_fu_278_p1(32 - 1 downto 0);
    frame_1_Din_A <= ap_const_lv8_0;
    frame_1_EN_A <= frame_1_EN_A_local;

    frame_1_EN_A_local_assign_proc : process(ap_CS_fsm_state2)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state2)) then 
            frame_1_EN_A_local <= ap_const_logic_1;
        else 
            frame_1_EN_A_local <= ap_const_logic_0;
        end if; 
    end process;

    frame_1_WEN_A <= ap_const_lv1_0;
    frame_2_Addr_A <= frame_2_Addr_A_local;
    frame_2_Addr_A_local <= std_logic_vector(shift_left(unsigned(frame_2_Addr_A_orig),to_integer(unsigned('0' & ap_const_lv32_0(31-1 downto 0)))));
    frame_2_Addr_A_orig <= zext_ln148_1_fu_278_p1(32 - 1 downto 0);
    frame_2_Din_A <= ap_const_lv8_0;
    frame_2_EN_A <= frame_2_EN_A_local;

    frame_2_EN_A_local_assign_proc : process(ap_CS_fsm_state2)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state2)) then 
            frame_2_EN_A_local <= ap_const_logic_1;
        else 
            frame_2_EN_A_local <= ap_const_logic_0;
        end if; 
    end process;

    frame_2_WEN_A <= ap_const_lv1_0;
    frame_3_Addr_A <= frame_3_Addr_A_local;
    frame_3_Addr_A_local <= std_logic_vector(shift_left(unsigned(frame_3_Addr_A_orig),to_integer(unsigned('0' & ap_const_lv32_0(31-1 downto 0)))));
    frame_3_Addr_A_orig <= zext_ln148_1_fu_278_p1(32 - 1 downto 0);
    frame_3_Din_A <= ap_const_lv8_0;
    frame_3_EN_A <= frame_3_EN_A_local;

    frame_3_EN_A_local_assign_proc : process(ap_CS_fsm_state2)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state2)) then 
            frame_3_EN_A_local <= ap_const_logic_1;
        else 
            frame_3_EN_A_local <= ap_const_logic_0;
        end if; 
    end process;

    frame_3_WEN_A <= ap_const_lv1_0;
    frame_4_Addr_A <= frame_4_Addr_A_local;
    frame_4_Addr_A_local <= std_logic_vector(shift_left(unsigned(frame_4_Addr_A_orig),to_integer(unsigned('0' & ap_const_lv32_0(31-1 downto 0)))));
    frame_4_Addr_A_orig <= zext_ln148_1_fu_278_p1(32 - 1 downto 0);
    frame_4_Din_A <= ap_const_lv8_0;
    frame_4_EN_A <= frame_4_EN_A_local;

    frame_4_EN_A_local_assign_proc : process(ap_CS_fsm_state2)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state2)) then 
            frame_4_EN_A_local <= ap_const_logic_1;
        else 
            frame_4_EN_A_local <= ap_const_logic_0;
        end if; 
    end process;

    frame_4_WEN_A <= ap_const_lv1_0;
    frame_5_Addr_A <= frame_5_Addr_A_local;
    frame_5_Addr_A_local <= std_logic_vector(shift_left(unsigned(frame_5_Addr_A_orig),to_integer(unsigned('0' & ap_const_lv32_0(31-1 downto 0)))));
    frame_5_Addr_A_orig <= zext_ln148_1_fu_278_p1(32 - 1 downto 0);
    frame_5_Din_A <= ap_const_lv8_0;
    frame_5_EN_A <= frame_5_EN_A_local;

    frame_5_EN_A_local_assign_proc : process(ap_CS_fsm_state2)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state2)) then 
            frame_5_EN_A_local <= ap_const_logic_1;
        else 
            frame_5_EN_A_local <= ap_const_logic_0;
        end if; 
    end process;

    frame_5_WEN_A <= ap_const_lv1_0;
    frame_6_Addr_A <= frame_6_Addr_A_local;
    frame_6_Addr_A_local <= std_logic_vector(shift_left(unsigned(frame_6_Addr_A_orig),to_integer(unsigned('0' & ap_const_lv32_0(31-1 downto 0)))));
    frame_6_Addr_A_orig <= zext_ln148_1_fu_278_p1(32 - 1 downto 0);
    frame_6_Din_A <= ap_const_lv8_0;
    frame_6_EN_A <= frame_6_EN_A_local;

    frame_6_EN_A_local_assign_proc : process(ap_CS_fsm_state2)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state2)) then 
            frame_6_EN_A_local <= ap_const_logic_1;
        else 
            frame_6_EN_A_local <= ap_const_logic_0;
        end if; 
    end process;

    frame_6_WEN_A <= ap_const_lv1_0;
    frame_7_Addr_A <= frame_7_Addr_A_local;
    frame_7_Addr_A_local <= std_logic_vector(shift_left(unsigned(frame_7_Addr_A_orig),to_integer(unsigned('0' & ap_const_lv32_0(31-1 downto 0)))));
    frame_7_Addr_A_orig <= zext_ln148_1_fu_278_p1(32 - 1 downto 0);
    frame_7_Din_A <= ap_const_lv8_0;
    frame_7_EN_A <= frame_7_EN_A_local;

    frame_7_EN_A_local_assign_proc : process(ap_CS_fsm_state2)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state2)) then 
            frame_7_EN_A_local <= ap_const_logic_1;
        else 
            frame_7_EN_A_local <= ap_const_logic_0;
        end if; 
    end process;

    frame_7_WEN_A <= ap_const_lv1_0;
    icmp_ln147_1_fu_358_p2 <= "1" when (phi_urem_load_reg_411 = ap_const_lv10_63) else "0";
    icmp_ln147_fu_257_p2 <= "1" when (x_fu_102 = ap_const_lv10_320) else "0";
    icmp_ln7_fu_348_p2 <= "1" when (unsigned(pixel_reg_476) > unsigned(ap_const_lv8_A0)) else "0";
    pixel_fu_303_p17 <= "XXXXXXXX";
    pixel_fu_303_p18 <= phi_mul_fu_98(19 downto 17);
    select_ln147_fu_363_p3 <= 
        ap_const_lv10_0 when (icmp_ln147_1_fu_358_p2(0) = '1') else 
        add_ln147_2_fu_353_p2;

    x_out_assign_proc : process(x_1_reg_417, icmp_ln147_reg_422, ap_CS_fsm_state6, ap_CS_fsm_state5)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state6)) then 
            x_out <= ap_const_lv10_320;
        elsif (((ap_const_logic_1 = ap_CS_fsm_state5) and (icmp_ln147_reg_422 = ap_const_lv1_0))) then 
            x_out <= x_1_reg_417;
        else 
            x_out <= "XXXXXXXXXX";
        end if; 
    end process;


    x_out_ap_vld_assign_proc : process(icmp_ln147_reg_422, ap_CS_fsm_state6, ap_CS_fsm_state5)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state6) or ((ap_const_logic_1 = ap_CS_fsm_state5) and (icmp_ln147_reg_422 = ap_const_lv1_0)))) then 
            x_out_ap_vld <= ap_const_logic_1;
        else 
            x_out_ap_vld <= ap_const_logic_0;
        end if; 
    end process;

    zext_ln148_1_fu_278_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(add_ln148_fu_273_p2),64));
    zext_ln148_fu_269_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(phi_urem_fu_94),16));
end behav;
