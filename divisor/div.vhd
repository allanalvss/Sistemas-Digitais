-- IFPB 28/05/2019	
-- Sistemas Digitais 
-- divisor
-- A e B entradas, A será dividido por B
-- Reset/Start - reiniciar e zerar o valor de acc(acumulador)
-- Resto -- cout o programa vai realizar a operação A-B e o resultado é direcionado para o acumulador

library ieee;
use ieee.std_logic_1164.all;

entity div is
generic(size:integer := 8);
port(A,B:in std_logic_vector(size-1 downto 0);
	  clk,reset:in std_logic;
	  resto,resultado:out std_logic_vector(size-1 downto 0);
	  ready:out std_logic);
end div;


architecture divisao of div is 

component subtrator is 
port(a,b:in std_logic_vector(size-1 downto 0);
	  s:out std_logic_vector(size-1 downto 0);
	  M:in std_logic;
	  cout:out std_logic);
end component;

signal acc:std_logic_vector(size-1 downto 0):= (others => '0');
signal w:std_logic_vector(size-1 downto 0):= (others => '0');
signal x:std_logic_vector(size-1 downto 0):= (others => '0');
signal temp_add:std_logic_vector(size-1 downto 0);
signal temp_sub:std_logic_vector(size-1 downto 0);
signal add_c:std_logic;
signal sub_c:std_logic;
signal status:std_logic;
signal temp:std_logic_vector(size-1 downto 0);


begin

temp<=(size-1 downto 1=>'0',0 =>sub_c);
sub:subtrator port map(w,x,temp_sub,'1',sub_c);
adder:subtrator port map(w,x,temp_add,'0',add_c);
ready<= status;
resto<= w ;
resultado <= acc;

process(reset,clk)


begin
if(reset ='0') then
status <= '0';
w <= a;
x <= b;
acc <= (others => '0');

elsif (clk'event and clk ='0') then 
if (sub_c = '1') then
 w <= temp_sub;
 acc <= temp_add;
else 
status <= '1';

end if;

end if;

end process;

end divisao;