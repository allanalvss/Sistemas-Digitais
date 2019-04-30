-- Data: 30/04/2019
-- Aluno: Artur Barôncio
-- Disciplina: Sistemas Digitais
-- Professor: Lincoln Machado

library ieee;
use ieee.std_logic_1164.all;

entity mult_nbits is
	generic(m: integer := 4);
	port(a,b: std_logic_vector(m-1 downto 0);
		  s: out std_logic_vector((2*m)-1 downto 0);
end mult_nbits;

architecture mult of mult_nbits is

component adder is
	generic(n: integer := m);
	port(a,b: in std_logic_vector(n-1 downto 0);
	     s: out std_logic_vector(n-1 downto 0);
		  cout: out std_logic);
end component;

type matrix is array (0 to m-1) of std_logic_vector(m-1 downto 0);
signal produto: matrix;
signal ss:matrix;
signal couts: std_logic_vector(m-1 downto 0);

begin

laco1: for linha in 0 to m-1 generate
    laco2: for coluna in 0 to m-1 generate
		  produto(linha)(coluna)<=a(linha) and b(coluna);
	 end generate;
end generate;

couts(0) <= '0';

laco3: for k in 0 to m-2 generate
    add: adder port map(a => ,
	                     b => produto(k+1),
								s => ,
								cout => couts(k+1));
end generate;

end mult;