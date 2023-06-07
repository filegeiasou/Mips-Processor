LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
ENTITY tb_MIPS_VHDL IS
END tb_MIPS_VHDL;
 
ARCHITECTURE behavior OF tb_MIPS_VHDL IS 
signal clk_t: std_logic:='0';
signal reset_t : std_logic:='1';
    COMPONENT mips
    PORT(
         clk1 : IN  std_logic;
         reset1 : IN  std_logic
        );
    END COMPONENT;

BEGIN
   m1: mips PORT MAP (
          clk1 => clk_t,
          reset1 => reset_t
        );

clk_t<= not clk_t after 50 ps;
process
begin 
reset_t <= '0'; wait for 2500 ps;	
end process;

END behavior;