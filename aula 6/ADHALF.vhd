
library ieee;
use ieee.std_logic_1164.all;

entity ADHALF is 
port(a,b:in std_logic;
	  G,P:out std_logic);
end ADHALF;

architecture half of ADHALF is 

begin

G<=a and b;
P<=a xor b;

end half;