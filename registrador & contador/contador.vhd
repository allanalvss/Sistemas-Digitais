-- IFPB 08/05/2019
-- Contadores

library ieee;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;


entity contador is 
port(clk,reset: in std_logic;
	  data_out:out std_logic_vector(3 downto 0));
end contador;


architecture cont of contador is 

signal conta:std_logic_vector(3 downto 0) := "0000";
begin

data_out<=conta;
process(clk)
begin
if(reset='1') then 
	conta <= "0000";	
elsif(clk'event and clk ='0') then
	conta <= std_logic_vector(signed(conta) + "0001");
end if;
end process;

end cont;