library ieee;
use ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.numeric_std.ALL;
s
entity mux32 is
port
(a, b: in std_logic_vector(31 downto 0);
ch: in std_logic;
c: out std_logic_vector(31 downto 0));
end mux32;

ARCHITECTURE dataflow OF mux32 IS
BEGIN
c <= a WHEN ch='0' ELSE b;
END dataflow;s