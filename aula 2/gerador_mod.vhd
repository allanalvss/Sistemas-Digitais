-- Aula 20/03/2019
-- gerador de bit paridade

entity gerador_mod is
port(A:in bit_vector(3 downto 0);
	S: out bit);
end gerador_mod;

architecture paridade of gerador_mod is
begin
S<= A(0) xor A(1) xor A(2) xor A(3);
end paridade;
