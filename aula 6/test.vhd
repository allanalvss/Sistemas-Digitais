library ieee;
use ieee.std_logic_1164.all;

entity test is 
end test;


architecture sim of test is 

component CTL is 
port(a,b: in std_logic_vector(3 downto 0);
	  cin: in std_logic;
	  cout:out std_logic;
	  saida:out std_logic_vector(3 downto 0));
end component;

signal entrada:std_logic_vector(3 downto 0);
signal entrada2:std_logic_vector(3 downto 0);
signal cin,cout:std_logic;
signal output:std_logic_vector(3 downto 0);



begin

x:CTL port map(entrada,entrada2,cin,cout,output);

entrada<="0001",
			"0010" after 50 ns,
			"0100" after 150 ns,
			"0011" after 250 ns;
			
entrada2<="0011",
			"0101" after 50 ns,
			"0100" after 150 ns,
			"0000" after 250 ns;
cin<='0';
end sim;