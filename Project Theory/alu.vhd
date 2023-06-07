library ieee;
use ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.numeric_std.ALL;

entity alu is
port
(readreg1, re_mux: in std_logic_vector(31 downto 0);
zero: out std_logic;
alu_ctr1 : in std_logic_vector(3 downto 0);
alu_res: out std_logic_vector(31 downto 0));
end alu ;


ARCHITECTURE behavioral OF alu IS
signal res : std_logic_vector (31 downto 0);
BEGIN
process(readreg1, re_mux)
begin
case  alu_ctr1 is
when "0010" =>
res <= std_logic_vector(unsigned(readreg1) + unsigned(re_mux)) ;
when "0110" =>
res <= std_logic_vector(unsigned(readreg1) -  unsigned(re_mux)) ;
when "0001" =>
res <= readreg1 or  re_mux ;
when "0000" =>
res <= readreg1 and  re_mux ;
when others => null;
res <= std_logic_vector(unsigned(readreg1) + unsigned(re_mux)) ;
end case;
end process;
alu_res <= res;
zero<= '0' when res = x"00000000" else '1';
END behavioral;