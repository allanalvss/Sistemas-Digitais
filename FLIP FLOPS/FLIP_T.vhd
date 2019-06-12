-- FLIP FLOP TIPO T
-- SISTEMAS DIGITAIS

library ieee;
use ieee.std_logic_1164.all;


entity FLIP_T is 
port( preset,reset:in std_logic;
		clk:in std_logic;
		Q:buffer std_logic);
end FLIP_T;


architecture TT of FLIP_T is 



begin

process(reset,preset,clk)

begin

	if(reset ='1') then
	Q<='0';
	elsif(preset ='1') then
	Q<='1';
	elsif(clk'event and clk='0') then
	Q<=not(Q);

end if;
 end process;

end TT;