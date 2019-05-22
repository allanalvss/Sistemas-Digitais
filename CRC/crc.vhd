-- IFPB 22/05/2019
-- CRC 
-- Sistemas Digitais

library ieee;
use ieee.std_logic_1164.all;

entity crc is 
port(ser_in,clk: in std_logic;
	  reset:in std_logic;
	  crc_out:out std_logic_vector(1 downto 0));
end crc;


architecture crcx2 of crc is

signal crc:std_logic_vector(1 downto 0):="00";
begin
crc_out<=crc;


process(clk,reset)

begin
if(reset = '1') then 
crc <= "00";
elsif(clk'event and clk='0') then
crc(0)<= ser_in xor crc(1);
crc(1)<=crc(0);                  -- signals so atualizam os valores no final do bloco
end if;


end process;

end crcx2;