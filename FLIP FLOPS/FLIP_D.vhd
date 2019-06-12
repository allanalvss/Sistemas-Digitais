-- FLIP FLOP TIPO D 
-- SISTEMAS DIGITAIS

library ieee;
use ieee.std_logic_1164.all;


entity FLIP_D is 
port(d:in std_logic;
	  clk:in std_logic;
	  Q,Q_B:buffer std_logic); -- permite a utilizacao da variavel mesmo sendo out;
end FLIP_D;


architecture FL of FLIP_D is



begin

Q_B<=not(Q);


process(clk)

begin

if(clk'event and clk='0') then

Q<=d;

end if;


end process;


end FL;