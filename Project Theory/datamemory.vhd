library ieee;
use ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.numeric_std.ALL;

entity datamem is
port
(alu_rlt: in std_logic_vector(31 downto 0);
readreg2: in std_logic_vector(31 downto 0);
memread1   : IN std_logic;
memwrite1  : IN std_logic;
readdata_d: out std_logic_vector(31 downto 0);
clk4 : in std_logic);
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
process(memwrite1,memread1,clk4)
BEGIN
if(clk4'event and clk4='1') then
if (memwrite1='1' ) then
dm(to_integer(unsigned(alu_rlt)))<=readreg2;
end if;
end if;
if (memread1='1') then 
readdata_d<=dm(to_integer(unsigned(alu_rlt)));
end if;
end process;
end dataflow;