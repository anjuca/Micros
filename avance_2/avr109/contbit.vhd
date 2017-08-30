library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity contbit is
	
	generic(
				DATA_WIDTH: natural:=4;
			   MAX_NUM   : natural :=8
	);
	
	port 
	(
		clk   	 : in std_logic;
		res   	 : in std_logic;
		ContMux   : out std_logic_vector(DATA_WIDTH-1 downto 0)
	);

end entity;

architecture rtl of contbit is

component registro is
 
		generic(
					DATA_WIDTH: natural:= 15
					);

			port(			
				D: in std_logic_vector((DATA_WIDTH -1) downto 0);
				clk, ena: in std_logic;
				reset: in std_logic;
				Q: out std_logic_vector((DATA_WIDTH -1) downto 0)
				);

end component;

component conttime is
	
	generic(
				DATA_WIDTH: natural:=4;
			   MAX_NUM   : natural :=8
	);
	
	port 
	(
		clk   	 : in std_logic;
		res   	 : in std_logic;
		ContMux   : out std_logic
	);

end component;


signal er,sr,sm,sument		     : std_logic_vector(DATA_WIDTH-1 downto 0);
signal controlmux, enareg,comp8 : std_logic;
begin

 Reg:Registro 

		generic map(
						DATA_WIDTH=>DATA_WIDTH
		)
 
		port map (
						D=>er,
						ena=>enareg,
						clk=>clk,
						reset=>res,
						Q=>sr
		);		
  
  contador: conttime
  
		port map(
						clk =>clk,
						res=>res,
						ContMux=>enareg
		);
		
  
 comp8<='1' when unsigned(sr)=MAX_NUM else
			'0';
	
 with comp8 select
 
	sm <= sr when '0',
		  (others=>'1') when others;
		  


sument <= "0001";

er<= std_logic_vector(unsigned(sument) +unsigned(sm));

ContMux <= sm;


end rtl;