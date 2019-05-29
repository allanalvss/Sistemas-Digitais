-- IFPB 29/05/2019	
-- Sistemas Digitais 
-- divisor otimizado
-- A e B entradas, A será dividido por B
-- Reset/Start - reiniciar e zerar o valor de acc(acumulador)
-- Resto -- cout o programa vai realizar a operação A-B e o resultado é direcionado para o acumulador

library ieee;
use ieee.std_logic_1164.all;

entity div2 is
generic(size:integer := 8);
port(A,B:in std_logic_vector(size-1 downto 0);
	  clk,reset:in std_logic;
	  resto,resultado:out std_logic_vector(size-1 downto 0);
	  ready:out std_logic);
end div2;


architecture divisao of div2 is 

component subtrator is
generic(n:integer:=2*size); 
port(a,b:in std_logic_vector(2*size-1 downto 0);
	  s:out std_logic_vector(2*size-1 downto 0);
	  M:in std_logic;
	  cout:out std_logic);
end component;



signal a_m,b_m:std_logic_vector(2*size-1 downto 0);
signal temp_a_m:std_logic_vector(2*size-1 downto 0);
signal temp_res:std_logic_vector(size-1 downto 0);
signal cout: std_logic;




begin
resultado <=temp_res;
resto <= a_m(size-1 downto 0);
sub:subtrator port map(a_m,b_m,temp_a_m,'1',cout);



process(reset,clk)

variable cont:integer range 0 to 9 := 0;
begin
if(reset ='1') then
	a_m (size -1 downto 0)<= A;
	a_m (2*size-1 downto size) <= (others =>'0');
	b_m (size -1 downto 0)<=(others =>'0');
	b_m (2*size-1 downto size) <=B;
	temp_res <= (others =>'0');
	ready <= '0';
	cont := 0;
	
elsif(clk'event and  clk='0') then

	if(cont = size+1) then 
	ready <= '1';
	else 
	cont := cont +1;
	temp_res(size -1 downto 1)<= temp_res(size-2 downto 0);
	temp_res(0)<= cout;
	b_m(2*size-2 downto 0) <= b_m (2*size-1 downto 1);
	b_m(2*size -1)<='0';
	
	if(cout = '1') then
	a_m<= temp_a_m;
	
	end if;
	
	end if;


end if; 

end process;

end divisao;