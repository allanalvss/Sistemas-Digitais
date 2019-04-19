--IFPB 27/03/2019
-- Sistemas Digitais
-- somador 4 bits


library ieee;
use ieee.std_logic_1164.all;
entity somadorIV is
port(a,b: in std_logic_vector(3 downto 0);
	  s: out std_logic_vector(3 downto 0);
	  cin : in std_logic;
	  cout: out std_logic);
end somadorIV;

architecture some of somadorIV is

-- declarando component
component add1b is 
port(a,b,cin: in std_logic;
	  s,cout:out std_logic);
end component;

-- criando sinais
signal carry:std_logic_vector(4 downto 0);

begin

-- cascateando os componentes
add0:add1b port map(a(0),b(0),carry(0),s(0),carry(1));
add1:add1b port map(a(1),b(1),carry(1),s(1),carry(2));
add2:add1b port map(a(2),b(2),carry(2),s(2),carry(3));
add3:add1b port map(a(3),b(3),carry(3),s(3),carry(4));

carry(0)<= cin;
cout <= carry(4);

end some;