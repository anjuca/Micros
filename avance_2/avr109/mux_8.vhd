-- Quartus Prime VHDL Template
-- Unsigned Multiply

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity mux_8 is
    Port ( SEL : in  STD_LOGIC_VECTOR (3 downto 0);     
           A   : in  STD_LOGIC_VECTOR (7 downto 0);     
           X   : out STD_LOGIC);                        
end entity;

architecture rtl of mux_8 is
begin
with SEL select
    X <= A(0) when "0000",
         A(1) when "0001",
         A(2) when "0010",
         A(3) when "0100",
			A(4) when "1000",
         A(5) when "1001",
         A(6) when "1101",
         A(7) when "1111",
			
         '0'  when others;
end rtl;