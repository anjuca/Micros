library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity conttime is
	
	generic(
				DATA_WIDTH: natural:=8;
			   MAX_NUM   : natural :=163
	);
	
	port 
	(
		clk   	 : in std_logic;
		res   	 : in std_logic;
		ContMux   : out std_logic
	);

end entity;

architecture rtl of conttime is

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

signal er,sr,sm,sument		 : std_logic_vector(DATA_WIDTH-1 downto 0);
signal sal_com			       : std_logic;
begin

 Reg:Registro 

		generic map(
						DATA_WIDTH=>DATA_WIDTH
		)
 
		port map (
						D=>er,
						ena=>'1',
						clk=>clk,
						reset=>res,
						Q=>sr
		);		
  
 sal_com<='1' when unsigned(sr)=MAX_NUM else
			 '0';
	
 with sal_com select
 
	sm <= sr when '0',
		  (others=>'0') when others;
		  


sument <= "0001";

er<= std_logic_vector(unsigned(sument) +unsigned(sm));


ContMux<=sal_com;


end rtl;