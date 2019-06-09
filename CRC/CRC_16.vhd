library ieee;
use ieee.std_logic_1164.all;

entity CRC_16 is 
port(ser_in,clk:in std_logic;
     reset:in std_logic;
	  crc_out:out std_logic_vector(15 downto 0));
	  
end CRC_16;


architecture circ of CRC_16 is 

signal crc:std_logic_vector(15 downto 0):="0000000000000000";

begin
crc_out<=crc;


process(reset,clk)

begin
if(reset = '1') then
crc<="0000000000000000";

elsif(clk'event and clk='0')then

crc(0)<= ser_in xor crc(15);

crc(2)<= crc(1) xor crc(15);

crc(15) <= crc(14) xor crc(15);
--- deslocando os bits
crc(14 downto 3)<= crc(13 downto 2);
crc(1)<=crc(0);

end if;

end process;


end circ;