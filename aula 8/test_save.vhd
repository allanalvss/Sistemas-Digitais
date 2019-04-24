
library ieee;
use ieee.std_logic_1164.all;

entity test_save is
generic(n:integer:=8);
end test_save;

architecture some of test_save is

component select_comp is
generic(n:integer:=8);
port(a,b:in std_logic_vector(n-1 downto 0);
	  cin:in std_logic;
	  cout:out std_logic;
	  saida:out std_logic_vector(n-1 downto 0));
end component;

signal a1,b1:std_logic_vector(n-1 downto 0);
signal cin,cout:std_logic;
signal s: std_logic_vector(n-1 downto 0);

begin 
x:select_comp port map(a1,b1,cin,cout,s);

a1<="00011000",
	 "00100100" after 100 ns,
	 "11111111" after 200 ns;
b1<="00101000",
	 "00100100" after 100 ns,
	 "11111111" after 200 ns;
cin<='0',
     '1' after 100 ns;
	
end some;
