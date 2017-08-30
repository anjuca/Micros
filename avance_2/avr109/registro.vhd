library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity registro is
 
		generic(
					DATA_WIDTH: natural:= 8
					);

			port(			
				D: in std_logic_vector((DATA_WIDTH -1) downto 0);
				clk, ena: in std_logic;
				reset: in std_logic;
				Q: out std_logic_vector((DATA_WIDTH -1) downto 0)
				);
				
end entity;

architecture rtl of registro is

begin 


Q<=(others=>'0') when reset='0' else d when ena='1' and rising_edge(clk);


end rtl; 