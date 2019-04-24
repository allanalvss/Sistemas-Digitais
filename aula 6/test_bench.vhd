library ieee;
use ieee.std_logic_1164.all;

entity test_bench is
end test_bench;

architecture test of test_bench is

component look_ahead is
port(a,b: in std_logic_vector(3 downto 0);
	  cin: in std_logic;
	  cout:out std_logic;
	  saida:out std_logic_vector(3 downto 0));
end component;

signal a, b, s: std_logic_vector (3 downto 0); 
signal cin, cout: std_logic;

begin

x: look_ahead port map (a,b,cin,cout,s);

a <= "0001",
     "0010" after 100 ns,
	  "0001" after 200 ns,
	  "0011" after 300 ns,
	  "0100" after 400 ns;
	  
b <= "0010",
     "0000" after 100 ns,
	  "1111" after 200 ns,
	  "0011" after 300 ns,
	  "0100" after 400 ns;

cin <= '0';	  

end test;