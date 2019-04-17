-- IFPB 27/03/2019
-- Sistema mux
-- Allan 


entity mux is
port(a,b,c: in bit;
     s:out bit);
end mux;

architecture mux of mux is
begin 
s<=((not c)and a)or(c and b);
end mux;