--IFPB 09/04/2019
--Sistemas Digitais
--Allan Victor Alves de Lima
-- somador look ahead


library ieee;
use ieee.std_logic_1164.all;

entity look_ahead is 
port(a,b: in std_logic_vector(3 downto 0);
	  cin: in std_logic;
	  cout:out std_logic;
	  saida:out std_logic_vector(3 downto 0));
end look_ahead;

architecture some of look_ahead is 

component ADHALF is 
port(a,b:in std_logic;
	  G,P:out std_logic);
end component;	 

component CL is 
port(Gin,Pin:in std_logic_vector(3 downto 0);
	  cin:in std_logic;
	  c:out std_logic_vector(4 downto 0));
end component;
 
 signal G,P:std_logic_vector(3 downto 0);
 signal carry:std_logic_vector(4 downto 0);
 
 begin
 laco:for i in 0 to 3 generate
 adds:ADHALF port map(a(i),b(i),G(i),P(i));
 end generate;
 look:CL port map(G,P,cin,carry);
 cout<=carry(4);
 laco2:for j in 0 to 3 generate
 saida(j)<=P(j) xor carry(j);
 end generate;
 end some;