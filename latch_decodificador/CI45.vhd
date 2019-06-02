-- 07/05/2019
-- Sistemas Digitais
-- decodificador display de 7 segmentos

library ieee;
use ieee.std_logic_1164.all;

entity CI45 is
generic(n:integer:=4); 
port(d:in std_logic_vector(n-1 downto 0);
	  LE_bar,BL_bar,LT_bar:in std_logic;
	  display:out std_logic_vector((2*n)-2 downto 0));
end CI45;


architecture circ of CI45 is 
signal latches:std_logic_vector(n-1 downto 0):="0000"; -- bloco que recebe a entrada em forma BCD
signal decoder:std_logic_vector((2*n)-2 downto 0); -- transfere o codigo BCD para o display
signal driver:std_logic_vector((2*n)-2 downto 0); -- recebe os valores decodificados 
signal mode:std_logic := '0'; -- anodo comum;


begin

latches <= d when LE_bar = '0' else 
				latches;
--- abcdefg
decoder <= "0000000" when BL_bar ='0' else
			  "1111110" when latches = "0000" else
			  "0110000" when latches = "0001" else
			  "1101101" when latches = "0010" else 
			  "1111001" when latches = "0011" else
			  "0110011" when latches = "0100" else
			  "1011011" when latches = "0101" else 
			  "1011111" when latches = "0110" else 
			  "1110000" when latches = "0111" else
			  "1111111" when latches = "1000" else
			  "0000000";
			 
driver <= "1111111" when LT_bar ='0'  else decoder;

laco: for i in 0 to (2*n)-2 generate
display(i)<= driver(i) xor mode;
end generate; 
			  
end circ;
