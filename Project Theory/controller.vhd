library ieee;
use ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.numeric_std.ALL;

entity controller is
	PORT (
		opcode        : IN std_logic_vector(5 DOWNTO 0); 
		regdst        : OUT std_logic;
		jump          : OUT std_logic;
		branch        : OUT std_logic;
		memread       : OUT std_logic;
		memtoregister : OUT std_logic;
		aluop         : OUT std_logic_vector(1 DOWNTO 0);
		memwrite      : OUT std_logic;
		alusrc        : OUT std_logic;
		regwrite      : OUT std_logic;
		rst2          : OUT std_logic;
	);
end controller;

ARCHITECTURE Behavioral OF controller IS
BEGIN
	process (opcode,rst2)
	BEGIN
		if(rst2='1) then
				regdst        <= '0';
				jump          <= '0';
				branch        <= '0';
				memread       <= '0';
				memtoregister <= '0';
				aluop         <= "00";
				memwrite      <= '0';
				alusrc        <= '0';
				regwrite      <= '0';
				regwrite      <= '0';
		end if; 
		case opcode IS
			WHEN "000000" => -- and, or, add, sub, slt: 0x00
				regdst        <= '1';
				jump          <= '0';
				branch        <= '0';
				memread       <= '0';
				memtoregister <= '0';
				aluop         <= "10";
				memwrite      <= '0';
				alusrc        <= '0';
				regwrite      <= '1' AFTER 10 ns;
			WHEN "100011" => -- load word(lw): 0x23
				regdst        <= '0';
				jump          <= '0';
				branch        <= '0';
				memread       <= '1';
				memtoregister <= '1';
				aluop         <= "00";
				memwrite      <= '0';
				alusrc        <= '1';
				regwrite      <= '1' AFTER 10 ns;
			WHEN "101011" => -- store word(beq): 0x2B
				regdst        <= 'X'; -- don't care
				jump          <= '0';
				branch        <= '0' AFTER 2 ns;
				memread       <= '0';
				memtoregister <= 'X'; -- don't care
				aluop         <= "00";
				memwrite      <= '1';
				alusrc        <= '1';
				regwrite      <= '0';
			WHEN "000100" => -- branch equal(beq): 0x04
				regdst        <= 'X'; -- don't care
				jump          <= '0';
				branch        <= '1' AFTER 2 ns;
				memread       <= '0';
				memtoregister <= 'X'; -- don't care
				aluop         <= "01";
				memwrite      <= '0';
				alusrc        <= '0';
				regwrite      <= '0';
			WHEN "000010" => -- jump(j): 0x02
				regdst        <= 'X';
				jump          <= '1';
				branch        <= '0';
				memread       <= '0';
				memtoregister <= 'X';
				aluop         <= "00";
				memwrite      <= '0';
				alusrc        <= '0';
				regwrite      <= '0';
			WHEN OTHERS => NULL; --implement other commands down here
				regdst        <= '0';
				jump          <= '0';
				branch        <= '0';
				memread       <= '0';
				memtoregister <= '0';
				aluop         <= "00";
				memwrite      <= '0';
				alusrc        <= '0';
				regwrite      <= '0';
		end case;
	end process;
end Behavioral;