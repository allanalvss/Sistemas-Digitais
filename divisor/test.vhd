
 -- 28/05/19
-- testbench divisor


library ieee;
use ieee.std_logic_1164.all;

entity test is
end test;

architecture sim of test is



component divisor is 
generic(size:integer:=8);
port(a,b:in std_logic_vector(size-1 downto 0);
	  clk,reset:in std_logic;
	  resto,resultado:out std_logic_vector(size-1 downto 0);
	  ready:out std_logic);
end component;


signal A,B: std_logic_vector(7 downto 0);
signal clk,reset: std_logic:='0';
signal resto,res: std_logic_vector(7 downto 0):="00000000";
signal ready: std_logic:='0';

begin

x: divisor port map (A,B,clk,reset,resto,res,ready);

A <= "00001000";
B <= "00000010";

process
begin

reset <= '1';
wait for 10 ns;
reset <= '0';
wait for 10 ns;

for i in 10 downto 0 loop
	clk <= '1';
	wait for 20 ns;
	clk <= '0';
	wait for 20 ns;
end loop;

wait;

end process;

end sim;
