-- Quartus Prime VHDL Template
-- Signed Adder

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity CONEXIONADO is

	port 
	(		
--			 alu_data_r_in: in std_logic_vector(7 downto 0); 
--          alu_data_d_in: in std_logic_vector(7 downto 0); 
	       idc_add: in std_logic;
	       idc_and: in std_logic; 
			 idc_or : in std_logic;
	       idc_eor: in std_logic;
	       idc_neg: in std_logic;
			 
			 cp2    : in std_logic;
			 cp2en  : in std_logic;
			 ireset : in std_logic;
			 reg_rd_in: in std_logic_vector(7 downto 0);
		  	 reg_rd_adr: in std_logic_vector(4 downto 0); 
			 reg_rr_adr: in std_logic_vector(4 downto 0);
			 reg_rd_wr : in std_logic; 
			 post_inc  : in std_logic;
			 pre_dec   : in std_logic;
			 reg_h_wr  : in std_logic;
			 reg_h_adr : in std_logic_vector(2 downto 0); 
		    w_op		  : in std_logic;
			 reg_rd_hb_in: in std_logic_vector(7 downto 0); 

	   
	       alu_data_out: out std_logic_vector(7 downto 0); 
	       alu_c_flag_status_out: out std_logic; 
	       alu_z_flag_status_out: out std_logic; 
	       alu_n_flag_status_out: out std_logic; 
	       alu_v_flag_status_out: out std_logic; 
	       alu_s_flag_status_out: out std_logic; 
	       alu_h_flag_status_out: out std_logic; 
			 
			 reg_rr_hb_out: out std_logic_vector(7 downto 0);  
			 spm_out: out std_logic_vector(15 downto 0); 
			 reg_z_out: out std_logic_vector(15 downto 0);
			 reg_h_out: out std_logic_vector(15 downto 0) 
			 
	);

end entity;

architecture rtl of CONEXIONADO is

	component alu_avr is
		port (
			
			 alu_data_r_in: in std_logic_vector(7 downto 0); 
          alu_data_d_in: in std_logic_vector(7 downto 0); 
	       idc_add: in std_logic;
	       idc_and: in std_logic; 
			 idc_or : in std_logic;
	       idc_eor: in std_logic;
	       idc_neg: in std_logic;
			 alu_c_flag_in: in std_logic;
	       alu_z_flag_in: in std_logic; 
	       idc_adc : in std_logic;
	       idc_adiw: in std_logic; 
	       idc_sub : in std_logic; 
	       idc_subi: in std_logic;
	       idc_sbc : in std_logic;
	       idc_sbci: in std_logic; 
	       idc_sbiw: in std_logic;
	       adiw_st : in std_logic;
	       sbiw_st : in std_logic;
	       idc_andi: in std_logic; 
			 idc_ori : in std_logic;
	       idc_com : in std_logic;
	       idc_inc : in std_logic; 
	       idc_dec : in std_logic;
	       idc_cp  : in std_logic;
	       idc_cpc : in std_logic;
	       idc_cpi : in std_logic;
	       idc_cpse: in std_logic;
	       idc_lsr : in std_logic;
	       idc_ror : in std_logic;
	       idc_asr : in std_logic;
	       idc_swap: in std_logic;
			 
	       
			 
			 alu_data_out  :out std_logic_vector(7 downto 0); 
	       alu_c_flag_out:out std_logic; 
	       alu_z_flag_out:out std_logic; 
	       alu_n_flag_out:out std_logic; 
	       alu_v_flag_out:out std_logic; 
	       alu_s_flag_out:out std_logic; 
	       alu_h_flag_out:out std_logic
	        
	
		);
	end component;
	
	component reg_file is
		port (
		
			cp2       : in std_logic; 
			cp2en		 : in std_logic; 
			ireset  	 : in std_logic;
			reg_rd_in : in std_logic_vector(7 downto 0);  
			reg_rd_adr: in std_logic_vector(4 downto 0); 
			reg_rr_adr: in std_logic_vector(4 downto 0);
			reg_rd_wr : in std_logic; 
			w_op		 : in std_logic;
			post_inc  : in std_logic;
			pre_dec   : in std_logic;
			reg_h_wr  : in std_logic;
			reg_rd_hb_in: in std_logic_vector(7 downto 0);
			reg_h_adr : in std_logic_vector(2 downto 0);
			
			
		   reg_z_out :out std_logic_vector(15 downto 0); 
			reg_h_out :out std_logic_vector(15 downto 0); 
			reg_rd_out:out std_logic_vector(7 downto 0); 
			reg_rr_out:out std_logic_vector(7 downto 0); 
			reg_rr_hb_out:out std_logic_vector(7 downto 0); 
			spm_out   :out std_logic_vector(15 downto 0)
			
		);
		
		END component;
component StatusRegister is
	port (
	
		  D			: in std_logic_vector(5 downto 0);
		  clk			: in std_logic;
		  ena			: in std_logic;
		  reset_n 	: in std_logic;
		  Q			: out std_logic_vector(5 downto 0)
	
	);
	
end component; 

signal s_alu_n_flag_out,s_alu_c_flag_out,s_alu_z_flag_out,s_alu_v_flag_out,s_alu_s_flag_out,s_alu_h_flag_out: std_logic;
signal s_reg_rr_out,s_reg_rd_out: std_logic_vector(7 downto 0); 

begin
	alu:alu_avr
	port map (
	
          alu_data_r_in	=> s_reg_rr_out, 
          alu_data_d_in	=> s_reg_rd_out, 
	       alu_c_flag_in	=> '0', 
	       alu_z_flag_in	=> '0', 
	       idc_add			=> idc_add, 
	       idc_adc			=> '0', 
	       idc_adiw		=> '0', 
	       idc_sub			=> '0', 
	       idc_subi		=> '0', 
	       idc_sbc			=> '0', 
	       idc_sbci		=> '0', 
	       idc_sbiw		=> '0', 
	       adiw_st			=> '0', 
	       sbiw_st			=> '0', 
	       idc_and			=> idc_and, 
	       idc_andi		=> '0', 
	       idc_or			=> idc_or, 
	       idc_ori			=> '0', 
	       idc_eor			=> idc_eor, 
	       idc_com			=> '0', 
	       idc_neg			=> idc_neg, 
	       idc_inc			=> '0', 
	       idc_dec			=> '0', 
	       idc_cp			=> '0', 
	       idc_cpc			=> '0', 
	       idc_cpi			=> '0', 
	       idc_cpse		=> '0', 
	       idc_lsr			=> '0', 
	       idc_ror			=> '0', 
	       idc_asr			=> '0', 
	       idc_swap		=> '0', 
	       alu_data_out	=> alu_data_out, 
	       alu_c_flag_out=> s_alu_c_flag_out, 
	       alu_z_flag_out=> s_alu_z_flag_out, 
	       alu_n_flag_out=> s_alu_n_flag_out, 
	       alu_v_flag_out=> s_alu_v_flag_out, 
	       alu_s_flag_out=> s_alu_s_flag_out, 
	       alu_h_flag_out=> s_alu_h_flag_out		
	
	);
	reg_general_propose:reg_file
	port map(
	
         cp2     		 => cp2, 
			cp2en        => cp2en, 
			ireset       => ireset, 
			reg_rd_in    => reg_rd_in, 
			reg_rd_out   => s_reg_rd_out, 
			reg_rd_adr   => reg_rd_adr, 
			reg_rr_out   => s_reg_rr_out, 
			reg_rr_adr   => reg_rr_adr, 
			reg_rd_wr    => reg_rd_wr, 
			post_inc     => post_inc, 
			pre_dec		 => pre_dec, 
			reg_h_wr		 => reg_h_wr, 
			reg_h_out 	 => reg_h_out, 
			reg_h_adr	 => reg_h_adr, 
			reg_z_out	 => reg_z_out, 
			w_op			 => w_op, 
			reg_rd_hb_in => reg_rd_hb_in, 
			reg_rr_hb_out=> reg_rr_hb_out, 
			spm_out	    => spm_out
		
		);
	registro:StatusRegister
	port map(
	
			D(0)		=> s_alu_c_flag_out,
			D(1)		=> s_alu_z_flag_out,
			D(2)		=> s_alu_n_flag_out,
			D(3)		=> s_alu_v_flag_out,
			D(4)		=> s_alu_s_flag_out,
			D(5)		=> s_alu_h_flag_out,
			clk		=> cp2,
			ena		=> cp2en,        
			reset_n  => ireset,
			Q(0)		=> alu_c_flag_status_out,
			Q(1)		=> alu_z_flag_status_out,
			Q(2)		=> alu_n_flag_status_out,
			Q(3)		=> alu_v_flag_status_out,
			Q(4)		=> alu_s_flag_status_out,
			Q(5)		=> alu_h_flag_status_out
	  );
	  
--	  s_reg_rr_out<=alu_data_r_in ;
--	  s_reg_rd_out<=alu_data_d_in;
end rtl;
