library ieee;
use ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.numeric_std.ALL;

entity datamem is
port
(alu_rlt: in std_logic_vector(31 downto 0);
readdata2: in std_logic_vector(31 downto 0);
memread   : IN std_logic;
memwrite  : IN std_logic;
readdata: out std_logic_vector(31 downto 0));
end datamem;

ARCHITECTURE dataflow OF datamem IS
type datame is array(0 to 15) of std_logic_vector(31 downto 0);
	SIGNAL dm : datame := (
		x"00000000",
		x"00000000",
		x"00000000",
		x"00000000",
		x"00000000",
		x"00000000",
		x"00000000",
		x"00000000",
		x"00000000",
		x"00000000",
		x"00000000",
		x"00000000",
		x"00000000",
		x"00000000",
		x"00000000",
		x"00000000"
	);
BEGIN
process(memwrite,memread)
BEGIN
if (memwrite='1') then
dm(to_integer(unsigned(alu_rlt)))<=readdata2;
end if;
if (memread='1') then 
readdata<=dm(to_integer(unsigned(alu_rlt)));
end if;
end process;
end dataflow;