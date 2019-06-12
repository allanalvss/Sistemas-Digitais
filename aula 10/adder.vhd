library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity adder is
generic(n: integer := 4);
port(a,b: in std_logic_vector(n-1 downto 0);
     s: out std_logic_vector(n-1 downto 0);
	  cout: out std_logic);
end adder;

architecture adder of adder is
signal res: std_logic_vector(n downto 0);
begin

res <= std_logic_vector(signed('0' & a) + signed(b));
s <= res(n-1 downto 0);
cout <= res(n);

end adder;