library ieee;
use ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.numeric_std.ALL;

entity pc is 
port ( pc_in : in std_logic_vector(31 downto 0);
pc_out : out std_logic_vector (31 downto 0);
rst : in std_logic);
end pc;

ARCHITECTURE dataflow OF pc IS
BEGIN
process (rst)
begin
if(rst = '1') then 
pc_out<= x"00000000";
else
pc_out <= pc_in ;
end if;
end process;
end dataflow;