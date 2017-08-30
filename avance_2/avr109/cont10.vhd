library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity cont10 is
	
	generic(
				DATA_WIDTH: natural:=4;
			   MAX_NUM   : natural :=8
	);
	
	port 
	(
		clk   	 : in std_logic;
		res   	 : in std_logic;
		ent		 : in std_logic;
--		SalHab    : out std_logic;
		ContMux   : out std_logic
	);

end entity;

architecture rtl of cont10 is

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

component registro1bit is
 
			port(
			
				D: in std_logic;
				clk, ena: in std_logic;
				reset: in std_logic;
				Q: out std_logic
				);
				
end component;


signal er,sr,sm,sument		 : std_logic_vector(DATA_WIDTH-1 downto 0);
signal comp10,comp0,sal_reg,sal_XOR : std_logic;
begin

 Reg:Registro 

		generic map(
						DATA_WIDTH=>DATA_WIDTH
		)
 
		port map (
						D=>er,
						ena=>ent,
						clk=>clk,
						reset=>res,
						Q=>sr
		);		
  
 comp10<='1' when unsigned(sr)=MAX_NUM else
			'0';
	
 with comp10 select
 
	sm <= sr when '0',
		  (others=>'1') when others;
		  


sument <= "0001";

er<= std_logic_vector(unsigned(sument) +unsigned(sm));

sal_XOR <= comp10 XOR sal_reg;
-- SalHab <= sal_XOR and comp10;

comp0 <= '1' when  unsigned(sr) = "0000" else
			'0';

ContMux <= comp10 or comp0;


end rtl;