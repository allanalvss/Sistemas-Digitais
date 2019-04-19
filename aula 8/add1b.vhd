-- IFPB 27/03/2019
-- somador comleto

library ieee;
use ieee.std_logic_1164.all;
entity add1b is 
port(a,b,cin: in std_logic;
	  s,cout:out std_logic);
end add1b;

architecture somador of add1b is
 signal k:std_logic;
 begin 
k<=(a xor b);
s<=((a xor b) xor cin);
cout<=((a and b) or (cin and k));
end somador;