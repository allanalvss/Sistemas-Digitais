-- Aula 20/03/2019
-- gerador de bit paridade

entity gerador is
port(A,B,C,D: in bit;
	S: out bit);
end gerador;

architecture paridade of gerador is
begin
S<= A xor B xor C xor D;
end paridade;
