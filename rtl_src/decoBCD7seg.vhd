library ieee;
use ieee.std_logic_1164.all;

entity decoBCD7seg is
port(ent: in std_logic_vector(3 downto 0);
    leds: out std_logic_vector (6 downto 0));
end decoBCD7seg;

architecture behav of decoBCD7seg is
begin 
	with ent select 									--Decodificador BCD a 7seg
		leds <= "1111001" when "0001",--1 
				  "0100100" when "0010",--2 
			     "0110000" when "0011",--3 
				  "0011001" when "0100",--4 
				  "0010010" when "0101",--5 
				  "0000010" when "0110",--6 
				  "1111000" when "0111",--7 
				  "0000000" when "1000",--8
				  "0010000" when "1001",--9
				  "1000000" when others;--0
		
end behav;--