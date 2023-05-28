library ieee;
use ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.numeric_std.ALL;

entity pc is 
port ( pc1 : in std_logic_vector(31 downto 0);
addr : out std_logic_vector (31 downto 0);
reset : in std_logic);
end pc;

ARCHITECTURE dataflow OF pc IS
BEGIN
process (reset)
begin
if(reset = '1') then 
addr<= x"00000000";
else
addr <= pc1 ;
end if;
end process;
end dataflow;