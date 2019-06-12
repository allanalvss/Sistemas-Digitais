

library ieee;
use ieee.std_logic_1164.all;


entity divisor_ot is 
generic(size:integer := 8);
port(a,b:in std_logic_vector(size-1 downto 0);
	  reset,clocks:in std_logic;
	  ready:out std_logic;
	  resto,resultado:out std_logic_vector(size-1 downto 0));
end divisor_ot;



architecture div of divisor_ot is

 
component subtrator is
generic(n:integer:=2*size); 
port(a,b:in std_logic_vector(2*size-1 downto 0);
	  s:out std_logic_vector(2*size-1 downto 0);
	  M:in std_logic;
	  cout:out std_logic);
end component;
-- inicia-se deslocando b para direita 
-- se b>a resto =0 e b é deslocado 
-- se a>= b , a= a-b e b é deslocado

signal a_temp,b_temp:std_logic_vector((2*size)-1 downto 0);
signal a_outs:std_logic_vector((2*size)-1 downto 0); -- saida subtrator
signal temp_res:std_logic_vector(size-1 downto 0); -- resultado
 
signal cout:std_logic;


begin

resultado<=temp_res;
resto<=a_temp(size-1 downto 0);
sub:subtrator port map(a_temp,b_temp,a_outs,'1',cout);


process(reset,clocks)

variable contagem:integer range 0 to 9:=0;


begin
if(reset='1') then
a_temp(size-1 downto 0)<=a;
a_temp((2*size-1) downto size)<=(others =>'0');
b_temp(size-1 downto 0)<=(others => '0');
b_temp((2*size-1) downto size)<=b;
temp_res<=(others =>'0');
ready<='0';
contagem:=0;

elsif(clocks'event and clocks='0') then

	if(contagem = size +1) then
	ready<='1';
	
	else
	contagem:=contagem+1;
	temp_res(size-1 downto 1)<= temp_res(size-2 downto 0);
	temp_res(0)<=cout;
	b_temp((2*size)-2 downto 0) <= b_temp((2*size-1)downto 1);
	b_temp(2*size -1)<='0';
	
	if(cout='1') then
	a_temp<=a_outs;
	
	end if;
	
	
	end if;
	
	
	end if;
end process;

end div;