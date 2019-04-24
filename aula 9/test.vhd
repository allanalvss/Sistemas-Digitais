

library ieee;
use ieee.std_logic_1164.all;

entity test is 
end test;

architecture sim of test is 

component subtrator is 
port(a,b:in std_logic_vector(3 downto 0);
	  s:out std_logic_vector(3 downto 0);
	  M:in std_logic;
	  cout:out std_logic);
end component;

signal A,B:std_logic_vector(3 downto 0);
signal op:std_logic;
signal saida:std_logic_vector(3 downto 0);
signal carry:std_logic;
begin
x:subtrator port map(A,B,saida,op,carry);



A<= "0001",
	 "0010" after 100 ns,
	 "0101" after 200 ns,
	 "0011" after 300 ns;
	 
B<= "0001",
	 "0010" after 100 ns,
	 "0101" after 200 ns,
	 "1000" after 300 ns;
	 
op<='0',
    '1' after 200 ns;



end sim;
