library ieee;
use ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.numeric_std.ALL;

entity mux5 is
port
(read20_16, read15_11: in std_logic_vector(4 downto 0);
regdst2: in std_logic;
writereg: out std_logic_vector(4 downto 0));
end mux5;

ARCHITECTURE dataflow OF mux5 IS
BEGIN
writereg <= read20_16 WHEN regdst2='0' ELSE read15_11;
END dataflow;