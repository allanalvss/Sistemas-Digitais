
library ieee;
use ieee.std_logic_1164.all;

entity CL is 
port(Gin,Pin:in std_logic_vector(3 downto 0);
	  cin:in std_logic;
	  c:out std_logic_vector(4 downto 0));
end CL;

architecture look of CL is 
begin
c(0)<=cin;
c(1)<=Gin(0) or (Pin(0) and cin);
c(2)<=Gin(1) or (Pin(1) and Gin(0)) or (Pin(1) and Pin(0) and cin);
c(3)<=Gin(2) or (Pin(2) and Gin(1)) or (Pin(2) and Pin(1) and Gin(0)) or (Pin(2) and Pin(1) and Pin(0) and cin);
c(4)<=Gin(3) or (Pin(3) and Gin(2)) or (Pin(3) and Pin(2) and Gin(1)) or (Pin(3) and Pin(2) and Pin(1)and Gin(0)) or(Pin(3) and Pin(2) and Pin(1) and Pin(0) and cin); 
end look;
	  