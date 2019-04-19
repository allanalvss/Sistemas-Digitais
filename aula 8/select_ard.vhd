-- IFPB 10/04/2019
-- somador carry select arder
-- Sistemas Digitais

library ieee;
use ieee.std_logic_1164.all;

entity select_ard is 
port(a,b:in std_logic_vector(3 downto 0);
	  cin:in std_logic;
	  cout:out std_logic;
	  saida:out std_logic_vector(3 downto 0));
end select_ard;


architecture some of select_ard is

component somadorIV is
port(a,b: in std_logic_vector(3 downto 0);
	  s: out std_logic_vector(3 downto 0);
	  cin : in std_logic;
	  cout: out std_logic);
end component;

signal s1,s2:std_logic_vector(3 downto 0);
signal c1,c2:std_logic;


begin
add1:somadorIV port map(a,b,s1,cin,c1);
add2:somadorIV port map(a,b,s2,cin,c2);
cout<=c1 when cin='0' else c2;
saida<=s1 when cin='0' else s2;
end some;