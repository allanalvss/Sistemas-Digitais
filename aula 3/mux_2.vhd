-- IFPB 27/03/2019
-- Sistema mux II
-- Allan 


entity mux_2 is
port(a,b,c: in bit;
     s:out bit);
end mux_2;

architecture mux_2 of mux_2 is
begin 
s<=a when c ='0' else 
b;
end mux_2;