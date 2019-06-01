

library ieee;

use ieee.std_logic_1164.all;

entity latches is 
port(preset,reset:in std_logic;
	  q_in,q_b:out std_logic);
end latches;

architecture lt of latches is
signal state:std_logic;

begin
q_in<=state;
q_b<=not(state);

process(preset,reset)

begin
if(reset='1') then
state <='0';
elsif(preset='1') then
state <='1';
end if;
end process;
end lt;