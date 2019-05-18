-- test cd4511
-- 07/05/2019
library ieee;
use ieee.std_logic_1164.all;

entity test is
end test;

architecture test of test is

component cd4511 is
	port(d: in std_logic_vector(3 downto 0);
	     n_LE,n_BL,n_LT: in std_logic;
		  disp: out std_logic_vector(6 downto 0));
end component;

signal d: std_logic_vector(3 downto 0);
signal n_LE,n_BL,n_LT: std_logic;
signal disp: std_logic_vector(6 downto 0);

begin

x: cd4511 port map(d,n_LE,n_BL,n_LT,disp);

d <= "0101",
     "0111" after 70 ns,
	  "1001" after 90 ns,
	  "0000" after 110 ns;

n_BL <= '1',
        '0' after 20 ns,
		  '1' after 30 ns,
		  '1' after 110 ns;

n_LT <= '1',
        '0' after 40 ns,
		  '1' after 50 ns,
		  '1' after 110 ns;

n_LE <= '1',
        '0' after 60 ns,
		  '1' after 75 ns,
		  '1' after 110 ns;
	  

end test;
