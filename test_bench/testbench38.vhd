------------------------------------------------------------------------
--TestBench
library ieee;
use ieee.std_logic_1164.all;

entity testbench38 is
end;

architecture tb_behave of testbench38 is
	component deco38
		port( oe: in std_logic;
			sel: in std_logic_vector(2 downto 0);
			sal: out std_logic_vector(7 downto 0));
	end component;

	signal test_oe: std_logic;
	signal test_sel: std_logic_vector(2 downto 0);
	signal test_sal: std_logic_vector(7 downto 0);
begin

UUT: deco38 port map(oe => test_oe, sel => test_sel, sal => test_sal);

test_oe <= '0', '1' after 70ps;
test_sel(0) <= '0', '1' after 20ps, '0' after 40ps, '1' after 60ps, '0' after 80ps, '0' after 100ps;
test_sel(1) <= '0', '1' after 10ps, '0' after 20ps, '1' after 30ps, '0' after 40ps, '0' after 50ps, '1' after 60ps;
test_sel(2) <= '0', '1' after 30ps, '0' after 60ps, '1' after 90ps, '0' after 120ps;

test_signals: process
	begin
		wait for 35ps;
			assert test_sal = "10000000"
				Report "salida no es correcta"
					severity ERROR;
		wait for 55ps;
			assert test_sal = "00000001"
				Report "salida no es correcta"
					severity ERROR;
		wait for 100ps;
			assert FALSE
				Report "FIN"
					severity FAILURE;
end process test_signals;
end tb_behave;