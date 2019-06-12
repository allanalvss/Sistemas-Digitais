-- FLIP FLOP RS
-- SISTEMAS DIGITAIS

library ieee;
use ieee.std_logic_1164.all;


entity FLIP_RS is 
port(s:in std_logic;
	  reset,clk:in std_logic;
	  Q,Q_B:buffer std_logic);
end FLIP_RS;



architecture FRS of FLIP_RS is



begin
Q_B<=not(Q);
process(reset,clk)

begin

if(reset ='1') then

Q<='0';
 
elsif(clk'event and clk='0') then

Q<=s;

end if;



end process;



end FRS;