---------------------------------------------------------------------------------
--TestBench

library ieee;
use ieee.std_logic_1164.all;

entity testbenchMUX is
end;

architecture tb_behave of testbenchMUX is
	component mux41
		port(I0, I1, I2, I3: in std_logic;
			  sel: in std_logic_vector(1 downto 0);
			  salm: out std_logic);
	end component;
	
	signal test_sel: std_logic_vector(1 downto 0);
	signal test_I0, test_I1, test_I2, test_I3: std_logic;
	signal test_salm: std_logic;
begin
	
	UUT: mux41 port map(sel => test_sel, I0 => test_I0, I1 => test_I1, I2 => test_I2, I3 => test_I3, salm => test_salm);
	
	test_sel <= "00", "11" after 20ps, "01" after 40ps, "00" after 60ps;
	test_I0 <= '0', '1' after 20ps, '0' after 40ps, '1' after 60ps, '0' after 80ps, '0' after 100ps;
	test_I1 <= '0', '1' after 10ps, '0' after 20ps, '1' after 30ps, '0' after 40ps, '0' after 50ps, '1' after 60ps;
	test_I2 <= '0', '1' after 30ps, '0' after 60ps, '1' after 90ps, '0' after 120ps;
	test_I3 <= '0', '1' after 40ps, '0' after 80ps;
	
test_signals: process
	begin
		wait for 25ps;
			assert test_salm = '0'
				Report "salida no es correcta"
					severity ERROR;
		wait for 55ps;
			assert test_salm = '0'
				Report "salida no es correcta"
					severity ERROR;
		wait for 100ps;
			assert FALSE
				Report "FIN"
					severity FAILURE;
end process test_signals;
end tb_behave;