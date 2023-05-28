library ieee;
use ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.numeric_std.ALL;

entity alu is
port
(readdata1, re_mux: in std_logic_vector(31 downto 0);
zero: out std_logic;
alu_ctr : in std_logic_vector(2 downto 0);
alu_res: out std_logic_vector(31 downto 0));
end alu ;


ARCHITECTURE behavioral OF alu IS
signal res : std_logic_vector (31 downto 0);
BEGIN
process(readdata1, re_mux)
begin
case  alu_ctr is
when "000" =>
res <= readdata1 +  re_mux ;
when "001" =>
res <= readdata1 -  re_mux ;
when "011" =>
res <= readdata1 or  re_mux ;
when "010" =>
res <= readdata1 and  re_mux ;
when others =>
res <= x"00000000";
end case;
end process;
zero<= '1' when res = x"00000000" else '0';
alu_res <= res;
END behavioral;