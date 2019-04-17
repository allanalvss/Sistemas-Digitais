-- testbench
entity testbench is
end testbench;

architecture test of testbench is

component gerador_mod is
port(A:in bit_vector(3 downto 0);
	  S: out bit);
end component;

signal input: bit_vector (3 downto 0);
signal output: bit;
begin
x:gerador_mod port map (input,output);

input <= "0000",
			"0101" after 10 ns,
			"1111" after 20 ns,
			"0010" after 30 ns,
			"1010" after 40 ns,
			"1110" after 50 ns;		
end test;