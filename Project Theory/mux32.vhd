library ieee;
use ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.numeric_std.ALL;


entity mux32 is
port
(dataread, alure: in std_logic_vector(31 downto 0);
memwrite: in std_logic;
writedat: out std_logic_vector(31 downto 0));
end mux32;

ARCHITECTURE dataflow OF mux32 IS
BEGIN
writedat <= alure WHEN memwrite='0' ELSE dataread;
END dataflow;