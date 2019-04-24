-- IFPB 27/03/2019
-- somador comleto

entity add1b is 
port(a,b,cin: in bit;
	  s,cout:out bit);
end add1b;

architecture somador of add1b is
 signal k:bit;
 begin 
k<=(a xor b);
s<=((a xor b) xor cin);
cout<=((a and b) or (cin and k));
end somador;