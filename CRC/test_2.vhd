library ieee;
use ieee.std_logic_1164.all;

entity test_2 is 
end test_2;


architecture sim of test_2 is


component CRC is 
port(ser_in,clk: in std_logic;
	  reset:in std_logic;
	  crc_out:out std_logic_vector(15 downto 0));
end component;

signal ser_in:std_logic:= '0';
signal clk:std_logic:= '1';
signal reset:std_logic:= '0';
signal crc_out:std_logic_vector(15 downto 0):= "0000000000000000";
-- vetor para teste
signal data_in:std_logic_vector(15 downto 0):= "1100000000000101";                --"01101110";--"11010111";"11010100"

begin

x:crc port map(ser_in,clk,reset,crc_out);

process

begin
reset <='1';
wait for 10 ns;
reset <='0';
for i in  15 downto 0 loop

clk <= '1' ;
ser_in <= data_in(i);
wait for 20 ns;

clk <= '0';
wait for 20 ns;

end loop;
 wait;
end process;




end sim;