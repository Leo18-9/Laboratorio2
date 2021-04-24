---------------------------------------------------------------------------------
--TestBench

library ieee;
use ieee.std_logic_1164.all;

entity testbenchLAB2 is
end;

architecture tb_behave of testbenchLAB2 is
	component Lab_2
		port(cbcd1, cbcd2, cbcd3, cbcd4: in std_logic_vector(3 downto 0);
		  --entHex: in std_logic_vector(3 downto 0);
		  --ent8: in std_logic_vector(2 downto 0);
		  selmux: in std_logic_vector(1 downto 0);
		  --oe8: in std_logic;
		  sal8: out std_logic_vector(7 downto 0);
		  salr, salHex1, salHex2: out std_logic_vector(6 downto 0));
	end component;
	
	signal test_cbcd1, test_cbcd2, test_cbcd3, test_cbcd4: std_logic_vector(3 downto 0);
	signal test_selmux: std_logic_vector(1 downto 0);
	signal test_salr: std_logic_vector(6 downto 0);
	
begin
	
	UUT: Lab_2 port map(selmux => test_selmux, cbcd1 => test_cbcd1, cbcd2 => test_cbcd2, cbcd3 => test_cbcd3, cbcd4 => test_cbcd4, salr => test_salr, sal8 => open, salHex1 => open, salHex2 => open);
	
	test_selmux <= "00", "10" after 20ps, "01" after 40ps, "11" after 60ps;
	test_cbcd1 <= "0000", "0011" after 20ps, "0110" after 40ps, "0010" after 60ps;
	test_cbcd2 <= "0000", "1001" after 20ps, "1100" after 40ps, "0010" after 60ps;
	test_cbcd3 <= "0000", "0001" after 20ps, "0101" after 40ps, "1010" after 60ps;
	test_cbcd4 <= "0000", "1101" after 20ps, "1100" after 40ps, "0010" after 60ps;
	
--	test_cbcd1 <= "0000", "0100" after 20ps, "1000" after 40ps, "1110" after 60ps, "1100" after 80ps, "1110" after 100ps;
--	test_cbcd2 <= "0000", "1100" after 10ps, "0011" after 20ps, "1000" after 30ps, "1111" after 40ps, "0001" after 50ps, "0110" after 60ps;
--	test_cbcd3 <= "0000", "0011" after 30ps, "0100" after 60ps, "0010" after 90ps, "0100" after 120ps;
--	test_cbcd4 <= "0000", "1110" after 40ps, "1001" after 80ps;
	
test_signals: process
	begin
		wait for 25ps;
			assert test_salr = "1111001"
				Report "salida no es correcta"
					severity ERROR;
		wait for 55ps;
			assert test_salr = "0010000"
				Report "salida no es correcta"
					severity ERROR;
		wait for 100ps;
			assert FALSE
				Report "FIN"
					severity FAILURE;
end process test_signals;
end tb_behave;