-- test para decodificador 
 
library ieee;
use ieee.std_logic_1164.all;

entity test is 
end test;


architecture sim of test is 


component CI45 is
generic(n:integer:=4); 
port(d:in std_logic_vector(n-1 downto 0);
	  LE_bar,BL_bar,LT_bar:in std_logic;
	  display:out std_logic_vector((2*n)-2 downto 0));
end component;

signal d_input:std_logic_vector(3 downto 0);
signal LE,BL,LT:std_logic;
signal display:std_logic_vector(6 downto 0);
begin 

x: CI45 port map(d_input,LE,BL,LT,display);

d_input <= "0101",
           "0010" after 70 ns,
	        "1000" after 90 ns,
	        "0000" after 110 ns,
			  "0001" after 120 ns;
LE <=   '0';
		  
BL <=   '0',
		  '1' after 70 ns;
		  
LT <=   '1';



end sim;