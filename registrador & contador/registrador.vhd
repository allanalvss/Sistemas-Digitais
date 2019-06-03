-- regitrador de deslocamento 

library ieee;
use ieee.std_logic_1164.all;

entity registrador is
generic (n:integer:=7); 
port(data_in,clocks,reset:in std_logic;
	  data_out:out std_logic_vector(n downto 0));
end registrador;

architecture reg of registrador is 

signal regist:std_logic_vector(n downto 0):= "00000000";
begin

process(clocks,reset)

begin

if(reset = '1') then
regist<="00000000";
elsif(clocks'event and clocks ='0') then
regist(n downto 1)<=regist(n-1 downto 0);
regist(0)<=data_in;
end if;
end process;
data_out<=regist;
end reg;