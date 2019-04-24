--IFPB 10/04/2019
-- Sistemas Digitais
-- Somadar carry select

library ieee;
use ieee.std_logic_1164.all;

entity select_comp is
generic(n:integer:=8);
port(a,b:in std_logic_vector(n-1 downto 0);
	  cin:in std_logic;
	  cout:out std_logic;
	  saida:out std_logic_vector(n-1 downto 0));
end select_comp;


architecture sel of select_comp is

--componentes

component somadorIV is
port(a,b: in std_logic_vector(3 downto 0);
	  s: out std_logic_vector(3 downto 0);
	  cin : in std_logic;
	  cout: out std_logic);
end component;


component select_ard is 
port(a,b:in std_logic_vector(3 downto 0);
	  cin:in std_logic;
	  cout:out std_logic;
	  saida:out std_logic_vector(3 downto 0));
end component;


--sinais
signal a1,b1:std_logic_vector(3 downto 0);
signal a2,b2:std_logic_vector(7 downto 4);
signal cout_sel:std_logic_vector(3 downto 0);
signal s1:std_logic_vector(3 downto 0);
signal s2:std_logic_vector(7 downto 4);


begin
a1<=a(3 downto 0);
b1<=b(3 downto 0);
a2<=a(7 downto 4);
b2<=b(7 downto 4);
saida(3 downto 0)<=s1;
saida(7 downto 4)<=s2;


add1:somadorIV port map(a1,b1,s1,cout_sel(0),cout_sel(1));
add2:select_ard port map(a2,b2,cout_sel(1),cout_sel(2),s2);
cout<=cout_sel(2);
cout_sel(0)<=cin;
end sel;
