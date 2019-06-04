--testbench contador

library ieee;
use ieee.std_logic_1164.all;

entity test2 is 
end test2;


architecture sim of test2 is 

component contador is 
port(clk,reset:in std_logic;
	  data_out:out std_logic_vector(3 downto 0));
end component;
signal clock:std_logic;
signal reset:std_logic;
signal data:std_logic_vector(3 downto 0);
begin
x:contador port map(clock,reset,data);

reset<='0';
process

begin
for j in 0 to 15 loop 

clock<='1';
wait for 10 ns;
clock<='0';
wait for 10 ns;
end loop;
wait;
end process;

end sim;