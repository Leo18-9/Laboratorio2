--------------------------------------------------------------------------------------
--TestBench

library ieee;
use ieee.std_logic_1164.all;

entity testbenchHEX is
end;

architecture tb_behave of testbenchHEX is
	component decoHEX7seg
		port(enth: in std_logic_vector(3 downto 0);
			  ledsh1, ledsh2: out std_logic_vector (6 downto 0));
	end component;
	
	signal test_enth: std_logic_vector(3 downto 0);
	signal test_ledsh1: std_logic_vector(6 downto 0);
	signal test_ledsh2: std_logic_vector(6 downto 0);
begin
	
UUT: decoHEX7seg port map(enth => test_enth, ledsh1 => test_ledsh1, ledsh2 => test_ledsh2);

test_enth <= "0000", "0101" after 20ps, "1111" after 40ps, "0010" after 60ps, "1100" after 80ps;

test_signals: process
	begin
		wait for 5ps;
			assert test_ledsh1 = "1000000"
				Report "salida no es correcta"
					severity ERROR;
			assert test_ledsh2 = "1000000"
				Report "salida no es correcta"
					severity ERROR;
		wait for 45ps;
			assert test_ledsh1 = "0010010"
				Report "salida no es correcta"
					severity ERROR;
			assert test_ledsh2 = "1111001"
				Report "salida no es correcta"
					severity ERROR;
		wait for 85ps;
			assert test_ledsh1 = "0100100"
				Report "salida no es correcta"
					severity ERROR;
			assert test_ledsh2 = "1111001"
				Report "salida no es correcta"
					severity ERROR;
		wait for 100ps;
			assert FALSE
				Report "FIN"
					severity FAILURE;
end process test_signals;
end tb_behave;