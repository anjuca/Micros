library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity registro1bit is
 
			port(
			
				D: in std_logic;
				clk, ena: in std_logic;
				reset: in std_logic;
				Q: out std_logic
				);
				
end entity;

architecture rtl of registro1bit is

begin 


Q<='0' when reset='0' else d when ena='1' and rising_edge(clk);


end rtl; 