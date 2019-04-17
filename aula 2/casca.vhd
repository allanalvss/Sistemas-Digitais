-- Aula 20/03/2019
-- casca

entity casca is

port(A,B,C : in bit;
S: out bit);
end casca;

architecture miolo of casca is
 signal D:bit;
begin
 D<=A and B;
 S<= D xor C;
 end miolo;
 