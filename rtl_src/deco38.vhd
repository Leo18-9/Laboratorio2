library ieee;
use ieee.std_logic_1164.all;

entity deco38 is
	port( oe: in std_logic;
			sel: in std_logic_vector(2 downto 0);
			sal: out std_logic_vector(7 downto 0));
end deco38;

architecture behave of deco38 is
	signal ent: std_logic_vector(3 downto 0); --Señal auxiliar
begin
	ent <= std_logic_vector'(sel(2),sel(1),sel(0), oe);
	with ent select									--Decodificador 3 a 8
		sal <= 	"00000001" when "0000",
					"00000010" when "0010",
					"00000100" when "0100",
					"00001000" when "0110",
					"00010000" when "1000",
					"00100000" when "1010",
					"01000000" when "1100",
					"10000000" when "1110",
					"00000000" when others;
end behave;--