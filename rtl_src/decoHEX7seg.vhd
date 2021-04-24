library ieee;
use ieee.std_logic_1164.all;

entity decoHEX7seg is
port(enth: in std_logic_vector(3 downto 0);
    ledsh1, ledsh2: out std_logic_vector (6 downto 0));
end decoHEX7seg;

architecture behav of decoHEX7seg is
	signal aux: std_logic_vector(13 downto 0);--Señal Auxiliar
begin
	with enth select 									--Decodificador HEX a 7seg
			aux <= "10000001111001" when "0001",--1 
					 "10000000100100" when "0010",--2 
				  	 "10000000110000" when "0011",--3 
					 "10000000011001" when "0100",--4 
					 "10000000010010" when "0101",--5 
					 "10000000000010" when "0110",--6 
					 "10000001111000" when "0111",--7 
					 "10000000000000" when "1000",--8
					 "10000000010000" when "1001",--9
					 "11110011000000" when "1010",--10
					 "11110011111001" when "1011",--11
					 "11110010100100" when "1100",--12
					 "11110010110000" when "1101",--13
					 "11110010011001" when "1110",--14
					 "11110010010010" when "1111",--15
					 "10000001000000" when others;--0
					 
	ledsh1 <= aux(6 downto 0);  --Unidad
	ledsh2 <= aux(13 downto 7); --Decena
end behav;--
