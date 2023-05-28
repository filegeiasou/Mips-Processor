library ieee;
use ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.numeric_std.ALL;

entity alu_ctl is
port
(aluop : in std_logic_vector (1 downto 0);
inst5_0 : in std_logic_vector (5 downto 0);
alu_ctr : out std_logic_vector(3 downto 0));
end alu_ctl;

ARCHITECTURE Behavioral OF alu_ctl IS
BEGIN
alu_ctr(3) <= '0'; 
alu_ctr(2) <= aluop(0) or (aluop(1) and inst5_0(1)); 
alu_ctr(1) <= not aluop(1) or not inst5_0(2); 
alu_ctr(0) <= (inst5_0(3) or inst5_0(0)) and aluop(1);
end Behavioral;