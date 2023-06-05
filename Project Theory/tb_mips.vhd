LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
ENTITY tb_MIPS_VHDL IS
END tb_MIPS_VHDL;
 
ARCHITECTURE behavior OF tb_MIPS_VHDL IS 
signal clk_t,reset_t : std_logic:='0';
constant clk_pe : time := 20 ns;
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

clk_p : process
begin
clk_t<= '0';
wait for clk_pe/2;
clk_t<= '1';
wait for clk_pe/2;
end process;

s_pro : process
begin 
reset_t <='1' ; wait for 12 ns;
reset_t <='0'; wait for clk_pe*24;
end process;
	


END behavior;