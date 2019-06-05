-- semaforo
-- IFPB- Sistemas Digitais -05/06/2019
library ieee;
use ieee.std_logic_1164.all;

entity semaforo is
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
end semaforo;



architecture farol of semaforo is 

type state is (yellow,green,red);
signal current_state: state :=yellow;



begin 


process(reset,clk)
variable tick_count:integer range 0 to max:= 0;

begin
if(reset = '1') then
tick_count:= 0;
current_state<=yellow;
elsif(clk'event and clk='0')then
tick_count:=tick_count + 1;
if(current_state = yellow and  tick_count=yellow_ticks) then
current_state<=red;
tick_count:= 0;
elsif(current_state=red and tick_count=red_ticks) then
current_state<=green;
tick_count:= 0;
elsif(current_state=green and tick_count=green_ticks) then
current_state<=yellow;
tick_count:= 0;
end if;

end if;

end process;

process(current_state)  -- definicao de cada estado

begin
if(current_state = yellow) then
yellow_leds<= '1';
red_leds<='0';
green_leds<='0';
elsif(current_state=red) then
yellow_leds<= '0';
red_leds<='1';
green_leds<='0';
elsif(current_state= green) then
yellow_leds<= '0';
red_leds<='0';
green_leds<='1';
end if;

end process;

end farol;