-- Copyright (C) 2017  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel MegaCore Function License Agreement, or other 
-- applicable license agreement, including, without limitation, 
-- that your use is for the sole purpose of programming logic 
-- devices manufactured by Intel and sold by Intel or its 
-- authorized distributors.  Please refer to the applicable 
-- agreement for further details.

-- ***************************************************************************
-- This file contains a Vhdl test bench template that is freely editable to   
-- suit user's needs .Comments are provided in each section to help the user  
-- fill out necessary details.                                                
-- ***************************************************************************
-- Generated on "08/20/2017 09:33:01"
                                                            
-- Vhdl Test Bench template for design  :  alu_avr
-- 
-- Simulation tool : ModelSim-Altera (VHDL)
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY alu_avr_vhd_tst IS
END alu_avr_vhd_tst;
ARCHITECTURE alu_avr_arch OF alu_avr_vhd_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL adiw_st : STD_LOGIC;
SIGNAL alu_c_flag_in : STD_LOGIC;
SIGNAL alu_c_flag_out : STD_LOGIC;
SIGNAL alu_data_d_in : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL alu_data_out : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL alu_data_r_in : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL alu_h_flag_out : STD_LOGIC;
SIGNAL alu_n_flag_out : STD_LOGIC;
SIGNAL alu_s_flag_out : STD_LOGIC;
SIGNAL alu_v_flag_out : STD_LOGIC;
SIGNAL alu_z_flag_in : STD_LOGIC;
SIGNAL alu_z_flag_out : STD_LOGIC;
SIGNAL idc_adc : STD_LOGIC;
SIGNAL idc_add : STD_LOGIC;
SIGNAL idc_adiw : STD_LOGIC;
SIGNAL idc_and : STD_LOGIC;
SIGNAL idc_andi : STD_LOGIC;
SIGNAL idc_asr : STD_LOGIC;
SIGNAL idc_com : STD_LOGIC;
SIGNAL idc_cp : STD_LOGIC;
SIGNAL idc_cpc : STD_LOGIC;
SIGNAL idc_cpi : STD_LOGIC;
SIGNAL idc_cpse : STD_LOGIC;
SIGNAL idc_dec : STD_LOGIC;
SIGNAL idc_eor : STD_LOGIC;
SIGNAL idc_inc : STD_LOGIC;
SIGNAL idc_lsr : STD_LOGIC;
SIGNAL idc_neg : STD_LOGIC;
SIGNAL idc_or : STD_LOGIC;
SIGNAL idc_ori : STD_LOGIC;
SIGNAL idc_ror : STD_LOGIC;
SIGNAL idc_sbc : STD_LOGIC;
SIGNAL idc_sbci : STD_LOGIC;
SIGNAL idc_sbiw : STD_LOGIC;
SIGNAL idc_sub : STD_LOGIC;
SIGNAL idc_subi : STD_LOGIC;
SIGNAL idc_swap : STD_LOGIC;
SIGNAL sbiw_st : STD_LOGIC;
COMPONENT alu_avr
	PORT (
	adiw_st : IN STD_LOGIC;
	alu_c_flag_in : IN STD_LOGIC;
	alu_c_flag_out : BUFFER STD_LOGIC;
	alu_data_d_in : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
	alu_data_out : BUFFER STD_LOGIC_VECTOR(7 DOWNTO 0);
	alu_data_r_in : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
	alu_h_flag_out : BUFFER STD_LOGIC;
	alu_n_flag_out : BUFFER STD_LOGIC;
	alu_s_flag_out : BUFFER STD_LOGIC;
	alu_v_flag_out : BUFFER STD_LOGIC;
	alu_z_flag_in : IN STD_LOGIC;
	alu_z_flag_out : BUFFER STD_LOGIC;
	idc_adc : IN STD_LOGIC;
	idc_add : IN STD_LOGIC;
	idc_adiw : IN STD_LOGIC;
	idc_and : IN STD_LOGIC;
	idc_andi : IN STD_LOGIC;
	idc_asr : IN STD_LOGIC;
	idc_com : IN STD_LOGIC;
	idc_cp : IN STD_LOGIC;
	idc_cpc : IN STD_LOGIC;
	idc_cpi : IN STD_LOGIC;
	idc_cpse : IN STD_LOGIC;
	idc_dec : IN STD_LOGIC;
	idc_eor : IN STD_LOGIC;
	idc_inc : IN STD_LOGIC;
	idc_lsr : IN STD_LOGIC;
	idc_neg : IN STD_LOGIC;
	idc_or : IN STD_LOGIC;
	idc_ori : IN STD_LOGIC;
	idc_ror : IN STD_LOGIC;
	idc_sbc : IN STD_LOGIC;
	idc_sbci : IN STD_LOGIC;
	idc_sbiw : IN STD_LOGIC;
	idc_sub : IN STD_LOGIC;
	idc_subi : IN STD_LOGIC;
	idc_swap : IN STD_LOGIC;
	sbiw_st : IN STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : alu_avr
	PORT MAP (
-- list connections between master ports and signals
	adiw_st => adiw_st,
	alu_c_flag_in => alu_c_flag_in,
	alu_c_flag_out => alu_c_flag_out,
	alu_data_d_in => alu_data_d_in,
	alu_data_out => alu_data_out,
	alu_data_r_in => alu_data_r_in,
	alu_h_flag_out => alu_h_flag_out,
	alu_n_flag_out => alu_n_flag_out,
	alu_s_flag_out => alu_s_flag_out,
	alu_v_flag_out => alu_v_flag_out,
	alu_z_flag_in => alu_z_flag_in,
	alu_z_flag_out => alu_z_flag_out,
	idc_adc => idc_adc,
	idc_add => idc_add,
	idc_adiw => idc_adiw,
	idc_and => idc_and,
	idc_andi => idc_andi,
	idc_asr => idc_asr,
	idc_com => idc_com,
	idc_cp => idc_cp,
	idc_cpc => idc_cpc,
	idc_cpi => idc_cpi,
	idc_cpse => idc_cpse,
	idc_dec => idc_dec,
	idc_eor => idc_eor,
	idc_inc => idc_inc,
	idc_lsr => idc_lsr,
	idc_neg => idc_neg,
	idc_or => idc_or,
	idc_ori => idc_ori,
	idc_ror => idc_ror,
	idc_sbc => idc_sbc,
	idc_sbci => idc_sbci,
	idc_sbiw => idc_sbiw,
	idc_sub => idc_sub,
	idc_subi => idc_subi,
	idc_swap => idc_swap,
	sbiw_st => sbiw_st
	);
init : PROCESS                                               
-- variable declarations                                     
BEGIN                                                        
        -- code that executes only once                      
WAIT;                                                       
END PROCESS init;                                           
always : PROCESS                                              
-- optional sensitivity list                                  
-- (        )                                                 
-- variable declarations                                      
BEGIN                                                         
        -- code executes for every event on sensitivity list  
WAIT;                                                        
END PROCESS always;                                          
END alu_avr_arch;
