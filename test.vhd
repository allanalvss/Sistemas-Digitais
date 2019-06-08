
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity test is 
end test;



	

architecture sim of test is


component double is
generic(n:integer:=4); 
port(ser_in,clk: in std_logic;
	  reset:in std_logic;
	  go_idle:in std_logic;
	  nible:out std_logic_vector(n-1 downto 0);
	  bit_out:out std_logic;
	  is_adding:out std_logic);
end component;


signal ser_in,clk:std_logic:='0';
signal reset:std_logic:='0';
signal go_idle:std_logic:='0';
signal nible:std_logic_vector(3 downto 0);
signal bit_out: std_logic;
signal is_adding:std_logic;


signal data_test:std_logic_vector(7 downto 0):="10101110";
begin

x:double port map(ser_in,clk,reset,go_idle,nible,bit_out,is_adding);

process

begin

for i in 7 downto 0 loop

clk<='1';
ser_in<=data_test(i);
wait for 50 ns;
clk<='0';
wait for 50 ns;
end loop;
wait;
end process;


end sim;