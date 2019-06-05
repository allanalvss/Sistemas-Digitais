-- testbench semaforo

library ieee;
use ieee.std_logic_1164.all;

entity test is 
end test;



architecture sim of test is 

component semaforo is
generic(max:integer :=12); 
port(green_ticks:in integer range 0 to max;
	  yellow_ticks:in integer range 0 to max;
	  red_ticks:in integer range 0 to max;
	  reset:in std_logic;
	  clk:in std_logic;
	  green_leds:out std_logic;
	  yellow_leds:out std_logic;
	  red_leds:out std_logic
	  );
end component;


signal green_ticks:integer range 0 to 12:=6;
signal yellow_ticks:integer range 0 to 12:=3;
signal red_ticks:integer range 0 to 12:=10;
signal reset:std_logic:='0';
signal clk:std_logic:='0';
signal green_leds:std_logic:='0';
signal yellow_leds:std_logic:='0';
signal red_leds:std_logic:='0';

begin
x:semaforo port map(green_ticks,yellow_ticks,red_ticks,reset,clk,green_leds,yellow_leds,red_leds);

process


begin

wait for 10 ns;
reset <= '1';
wait for 50 ns;
reset <= '0';
wait for 30 ns;
reset<='1';
wait for 50 ns;
reset<='0';

for i in 0 to 50 loop
clk<= '1';
wait for 20 ns;
clk <= '0';
wait for 20 ns;
end loop;
wait;

end process;

end sim;
