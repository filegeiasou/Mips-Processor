library ieee;
use ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.numeric_std.ALL;

entity adder is 
port(
a ,b : in std_logic_vector (31 downto 0);
c: out std_logic_vector(31 downto 0));
end adder;

architecture dtflow of adder is
begin
c <= a + b;
end dtflow;