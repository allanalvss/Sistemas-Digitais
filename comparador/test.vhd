library ieee;
use ieee.std_logic_1164.all;

entity test is 
generic(n:integer:=4);
end test;

architecture sim of test is

component comparador is 
generic(n:integer:=4);
port(a,b:in std_logic_vector(n-1 downto 0);
	  cin:in std_logic;
	  cout1,cout2:out std_logic;
	  saida1,saida2:out std_logic_vector(n-1 downto 0));
end component;

signal entrada1,entrada2:std_logic_vector(n-1 downto 0);
signal saidaI,saidaII:std_logic_vector(n-1 downto 0);
signal cin,carry,carry2:std_logic;
begin 
x:comparador port map(entrada1,entrada2,cin,carry,carry2,saidaI,saidaII);


entrada1<="0001",
			 "0010" after 100 ns,
			 "0011" after 200 ns,
			 "1000" after 300 ns;
			 
entrada2<="1111",
			 "0101" after 100 ns,
			 "0011" after 200 ns,
			 "0010" after 300 ns;
cin<='0';
			 
end sim;
