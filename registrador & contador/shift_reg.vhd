-- IFPB 08/05/2019	
-- Allan Alves
-- Registrador de deslocamento

library ieee;
use ieee.std_logic_1164.all;

entity shift_reg is 
port(data_in,clk:in std_logic;
	  data_out:out std_logic_vector(7 downto 0));
end shift_reg;

architecture registrador of shift_reg is
signal reg:std_logic_vector(7 downto 0):= "00000000";
begin


process(clk)
begin

if(clk='0') then
reg(7 downto 1)<=reg(6 downto 0);
reg(0)<=data_in;
end if;

end process;

data_out<=reg;
end registrador;