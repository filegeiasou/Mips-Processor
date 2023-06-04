
library ieee;
use ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.numeric_std.ALL;

entity addpc is 
port(
pc_cu : in std_logic_vector (31 downto 0);
pc_ne: out std_logic_vector(31 downto 0));
end addpc;

architecture dtflow of addpc is
begin
pc_ne <= pc_cu + x"00000001";
end dtflow;
