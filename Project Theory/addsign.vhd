library ieee;
use ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.numeric_std.ALL;

entity addpc is 
port(
sign_extd : in std_logic_vector (31 downto 0);
pc_next1: in std_logic_vector(31 downto 0);
pc_next2 : out std_logic_vector(31 downto 0));
end addpc;

architecture dtflow of addpc is
begin
pc_next2 <= pc_next1 + sign_extd;
end dtflow;
