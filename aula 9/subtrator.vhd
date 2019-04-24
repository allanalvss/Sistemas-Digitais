-- IFPB 16/04/2019		
-- somador e subtrator

library ieee;
use ieee.std_logic_1164.all;

entity subtrator is 
port(a,b:in std_logic_vector(3 downto 0);
	  s:out std_logic_vector(3 downto 0);
	  M:in std_logic;
	  cout:out std_logic);
end subtrator;

architecture add of subtrator is 

component add1b is 
port(a,b,cin: in std_logic;
	  s,cout:out std_logic);
end component;

signal sel:std_logic_vector(3 downto 0);
signal carry: std_logic_vector (4 downto 0);
begin

laco: for i in 0 to 3 generate
sel(i)<=b(i) xor M;
end generate;

laco2: for j in 0 to 3 generate
adds:add1b port map(  a(j),
							 sel(j),
							 carry(j),
							 s(j),
							 carry(j+1));
end generate;
carry (0)<= M;
cout <= carry(4);
end add;