--------------------------------------------------------------------------------
--TestBench

library ieee;
use ieee.std_logic_1164.all;

entity testbenchBCD is
end;

architecture tb_behave of testbenchBCD is
	component decoBCD7seg
		port(ent: in std_logic_vector(3 downto 0);
			  leds: out std_logic_vector (6 downto 0));
	end component;
	
	signal test_ent: std_logic_vector(3 downto 0);
	signal test_leds: std_logic_vector(6 downto 0);
begin
	
UUT: decoBCD7seg port map(ent => test_ent, leds => test_leds);

test_ent <= "0000", "0101" after 20ps, "0001" after 40ps, "0010" after 60ps, "1000" after 80ps;

test_signals: process
	begin
		wait for 5ps;
			assert test_leds = "1000000"
				Report "salida no es correcta"
					severity ERROR;
		wait for 65ps;
			assert test_leds = "0100100"
				Report "salida no es correcta"
					severity ERROR;
		wait for 100ps;
			assert FALSE
				Report "FIN"
					severity FAILURE;
end process test_signals;
end tb_behave;
	