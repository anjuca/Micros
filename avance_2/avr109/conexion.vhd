library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity conexion is
	
	generic(
				DATA_WIDTH: natural:=4;
			   MAX_NUM   : natural :=8
	);
	
	port 
	(	    
			 rst: in std_logic;
	       clk: in std_logic;
--	       rxd: in std_logic;
	       txd: out std_logic;
			 data: in std_logic_vector(7 downto 0);
	       intercept_mode: out std_logic;
	       prog_mode: out std_logic;
	       prog_addr: out std_logic_vector (15 downto 0);
	       prog_data: out std_logic_vector (15 downto 0);
	       prog_data_in: in std_logic_vector (15 downto 0);
	       prog_low: out std_logic;
	       prog_high: out std_logic;
	       debug: out std_logic_vector (7 downto 0)
	);

end entity;

architecture rtl of conexion is

component contbit is
 
	
	generic(
				DATA_WIDTH: natural:=4;
			   MAX_NUM   : natural :=8
	);
	
	port 
	(
		clk   	 : in std_logic;
		res   	 : in std_logic;
		ContMux   : out std_logic_vector(3 downto 0)
	);

end component;

component avr109 is
 
			port(			
				
	       rst: in std_logic;
	       clk: in std_logic;
	       rxd: in std_logic;
	       txd: out std_logic;
	       intercept_mode: out std_logic;
	       prog_mode: out std_logic;
	       prog_addr: out std_logic_vector (15 downto 0);
	       prog_data: out std_logic_vector (15 downto 0);
	       prog_data_in: in std_logic_vector (15 downto 0);
	       prog_low: out std_logic;
	       prog_high: out std_logic;
	       debug: out std_logic_vector (7 downto 0)
	);
				
end component;


signal serial_rx : std_logic;
signal cont_mux: std_logic_vector(3 downto 0);

begin

 Cont:contbit 

		generic map(
						DATA_WIDTH=>DATA_WIDTH
		)
 
		port map (
						clk => clk,  	 
						res => rst, 		 
						ContMux => cont_mux 
		);

avr109_c : avr109
		port map 
				(			
					 rst => rst,
					 clk => clk, 
					 rxd => serial_rx,
					 txd => txd,
					 intercept_mode => intercept_mode,
					 prog_mode => prog_mode, 
					 prog_addr => prog_addr, 
					 prog_data => prog_data,
					 prog_data_in => prog_data_in,
					 prog_low => prog_low, 
					 prog_high => prog_high, 
					 debug => debug
				);		

			 
			with cont_mux select
    serial_rx <= data(0) when "0000",
					  data(1) when "0001",
					  data(2) when "0010",
					  data(3) when "0100",
					  data(4) when "1000",
					  data(5) when "1001",
					  data(6) when "1101",
					  data(7) when "1111",
			        '0'  when others; 
				
end rtl;