library ieee;
use ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.numeric_std.ALL;

entity signex is
port
(read15_0: in std_logic_vector(15 downto 0);
signext: out std_logic_vector(31 downto 0));
end signex;

ARCHITECTURE dataflow OF signex IS
BEGIN
signext <= x"0000" & read15_0 when read15_0(15)='0' else x"FFFF" & read15_0 ;
end dataflow;