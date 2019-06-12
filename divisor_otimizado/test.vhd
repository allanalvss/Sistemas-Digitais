  
  
library ieee;
use ieee.std_logic_1164.all;


entity test is 
end test;


architecture sim of test is 

component divisor_ot is 
generic(size:integer := 8);
port(a,b:in std_logic_vector(size-1 downto 0);
	  reset,clocks:in std_logic;
	  ready:out std_logic;
	  resto,resultado:out std_logic_vector(size-1 downto 0));
end component;


signal A:std_logic_vector(7 downto 0):="00001111";
signal B:std_logic_vector(7 downto 0):="00000011";
signal clk:std_logic:= '0';
signal reset:std_logic:='0';
signal resto,resultado:std_logic_vector(7 downto 0);
signal ready:std_logic:= '1';

begin
x:divisor_ot port map(A,B,reset,clk,ready,resto,resultado);


process

begin
 wait for 10 ns;
 reset<= '1';
 wait for 10 ns;
 reset<='0';
for i in 0 to 15  loop
clk <='1';
wait for 100 ns;
clk <='0';
wait for 100 ns;
end loop;
wait;
end process;


end sim;