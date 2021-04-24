library ieee;
use ieee.std_logic_1164.all;

entity Lab_2 is
	port(cbcd1, cbcd2, cbcd3, cbcd4: in std_logic_vector(3 downto 0);
		  --entHex: in std_logic_vector(3 downto 0);
		  --ent8: in std_logic_vector(2 downto 0);
		  selmux: in std_logic_vector(1 downto 0);
		  --oe8: in std_logic;
		  sal8: out std_logic_vector(7 downto 0);
		  salr, salHex1, salHex2: out std_logic_vector(6 downto 0));
end Lab_2;

architecture behav of Lab_2 is
	signal salmux: std_logic_vector(3 downto 0);
begin

mux_gen: for i in 3 downto 0 generate
	U1: entity work.mux41 port map(I0 => cbcd1(i), I1 => cbcd2(i), I2 => cbcd3(i), I3 => cbcd4(i), sel => selmux, salm => salmux(i));
end generate;

U2: entity work.decoBCD7seg port map(ent => salmux, leds => salr);

U3: entity work.deco38 port map(oe => cbcd1(3), sel => std_logic_vector'(cbcd1(2),cbcd1(1),cbcd1(0)), sal => sal8);

U4: entity work.decoHEX7seg port map(enth => cbcd2, ledsh1 => salHex1, ledsh2 => salHex2);

end behav;--



