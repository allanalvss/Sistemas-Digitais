-- Arquivo Testbench-simulação
entity testbench is
end testbench;

architecture sim of testbench is
-- signal and component's

component CI7404 is
port(
            A1,A2,A3,A4,A5,A6: in BIT;
            Y1,Y2,Y3,Y4,Y5,Y6: out BIT
);
end component;


signal aI,aII,aIII,aIV,aV,aVI: bit;
signal yI,yII,yIII,yIV,yV,yVI: bit;


begin
x:CI7404 port map(aI,aII,aIII,aIV,aV,aVI,
						yI,yII,yIII,yIV,yV,yVI); -- colocar em ordem 
	
-- definindo sinais de entrada	
						
aI <= '0',
		'1' after 90 ns,
		'0' after 200 ns,
		'1' after 250 ns;
aII <= '0',
		 '1' after 90 ns,
		'0' after 200 ns,
		'1' after 250 ns;
aIII <= '0',
		'1' after 90 ns,
		'0' after 200 ns,
		'1' after 250 ns;
aIV <= '0',
		'1' after 90 ns,
		'0' after 200 ns,
		'1' after 250 ns;	
aV <= '0',
		'1' after 90 ns,
		'0' after 200 ns,
		'1' after 250 ns;
aVI <= '0',
		'1' after 90 ns,
		'0' after 200 ns,
		'1' after 250 ns;
	
end sim;