-- Sistemas Digitais
-- 08/06/2019

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity double is
generic(n:integer:=4); 
port(ser_in,clk: in std_logic;
	  reset:in std_logic;
	  go_idle:in std_logic;
	  nible:out std_logic_vector(n-1 downto 0);
	  bit_out:out std_logic;
	  is_adding:out std_logic);
end double;

architecture calc of double is

type state is (idle,shift,add3);
signal current_state:state:=shift;
signal data:std_logic_vector(n-1 downto 0):="0000";
begin


is_adding <= '1' when data > "0100" 
                           else '0'; 
nible<=data;
bit_out<=data(n-1);


process(reset,clk,go_idle)

begin
	if(reset ='1') then
	data<="0000";
	current_state<=shift;
	elsif(clk'event and clk='0') then
	
	if(current_state=shift and data> "0100") then
	current_state<=add3;
	data<=std_logic_vector(signed(data)+"0011");
	elsif(current_state= shift and go_idle = '1') then
	current_state <= idle;
	elsif(current_state =add3 or current_state= idle) then
	current_state<=shift;
	data(n-1 downto 1)<=data(n-2 downto 0);
	data(0)<=ser_in;
	elsif(current_state= shift) then
	data(n-1 downto 1)<=data(n-2 downto 0);
	data(0)<=ser_in;
	end if;

end if;

end process;



end calc;