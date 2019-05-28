 -- test divisor
 -- 28/05/2019
 
 
 library ieee;
 use ieee.std_logic_1164.all;
 
 
 entity test is 
 generic(n:integer:=8);
 end test;
 
 
 architecture sim of test is 
 component div is 
	 port(A,B:in std_logic_vector(n-1 downto 0);
	  clk,reset:in std_logic;
	  resto,resultado:out std_logic_vector(n-1 downto 0);
	  ready:out std_logic);
end component;
 
 
 signal A,B:std_logic_vector(n-1 downto 0);
 signal clk,reset:std_logic;
 signal resto,resultado:std_logic_vector(n-1 downto 0);
 signal ready:std_logic;
 begin
 
 x: div port map (A,B,clk,reset,resto,resultado,ready);
 
 process
 
begin

reset <='1';

wait for 10 ns;

reset <='0';


 
 end process;
 
 
 end sim;