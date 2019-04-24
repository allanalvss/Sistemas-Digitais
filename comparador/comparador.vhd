
library ieee;
use ieee.std_logic_1164.all;

entity comparador is 
generic(n:integer:=4);
port(a,b:in std_logic_vector(n-1 downto 0);
	  cin:in std_logic;
	  cout1,cout2:out std_logic;
	  saida1,saida2:out std_logic_vector(n-1 downto 0));
end comparador;

architecture some of comparador is

component somadorIV is
port(a,b: in std_logic_vector(3 downto 0);
	  s: out std_logic_vector(3 downto 0);
	  cin : in std_logic;
	  cout: out std_logic);
end component;

component look_ahead is 
port(a,b: in std_logic_vector(3 downto 0);
	  cin: in std_logic;
	  cout:out std_logic;
	  saida:out std_logic_vector(3 downto 0));
end component;

--signal carry1,carry2:std_logic;

begin
add_ripple:somadorIV port map(a,b,saida1,cin,cout1);
add_look:look_ahead port map(a,b,cin,cout2,saida2);
end some;