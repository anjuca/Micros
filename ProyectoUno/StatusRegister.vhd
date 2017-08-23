-- Quartus Prime VHDL Template
-- Signed Adder

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity StatusRegister is

	port 
	(		 
			 D			: in std_logic_vector(5 downto 0);
			 clk		: in std_logic;
			 ena		: in std_logic;
			 reset_n : in std_logic;
			 Q			: out std_logic_vector(5 downto 0)
	);

end entity;

architecture rtl of StatusRegister is

	begin
		Q <= (others=>'0') when reset_n='0' else D when ena='1' and rising_edge(clk); 
	
	end rtl;	