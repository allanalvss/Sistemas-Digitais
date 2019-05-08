-- test para registrador 
-- 08/05/2019

library ieee;
use ieee.std_logic_1164.all;

entity test is 
end test;

architecture sim of test is 


component shift_reg is 
port(data_in,clk:in std_logic;
	  data_out:out std_logic_vector(7 downto 0));
end component;


signal data_in:std_logic := '0';
signal clk:std_logic := '1';
signal data_out:std_logic_vector(7 downto 0);
signal teste: std_logic_vector(7 downto 0):= "10110111";


begin

x:shift_reg port map(data_in,clk,data_out);

process
begin

for i in 0 to 7 loop 

  clk <= '1';
  data_in<= teste(7-i);
  wait for 10 ns;
  clk <= '0';
  wait for 10 ns;
end loop;
 wait;
end process;


end sim;