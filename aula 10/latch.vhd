-- IFPB 30/04/2019			
-- Allan Victor 
-- Latch ( sem borda de clock)

library ieee;
use ieee.std_logic_1164.all;

entity latche is 
port(s,r: in std_logic;
	  q,qb:out std_logic);                              --q,qb:buffer std_logic);
end latche;

architecture combinacional of latche is
signal a,b:std_logic;
signal state:std_logic;

begin
a<=not(s);
b<=not(r);
q<=state;
qb<=not(state);

process(r,s)
begin

	if(r='1') then
	state<='0';
	elsif(s='1') then
	state<='1';
	end if;


end process;

end combinacional;