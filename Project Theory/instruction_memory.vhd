library ieee;
use ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.numeric_std.ALL;

entity instrmemory is
port( read_addr: in std_logic_vector(31 downto 0);
instr : out  std_logic_vector(31 downto 0));
end instrmemory;


ARCHITECTURE arch OF instrmemory IS
type iadd is array(0 to 10) of std_logic_vector(31 downto 0);
constant imem: iadd :=(
"00100000000000000000000000000000",--addi $0 , $0 , 0 okey
"00100000010000100000000000000000",--addi $2 , $2 , 0 okey
"00100000100000100000000000000000",--addi $2 , $4 , 0 okey
"00100000000000110000000000000001",--addi $3 , $0 , 1 okey
"00100000000001010000000000000011",--addi $5 , $0 , 3 okey
"00000000011000000011000000100000",--L1 : add $6,$3,$0 okey
"10101100100001100000000000000000",--sw $6,0($4) okey
"00100000011000110000000000000001",--addi $3 , $3 , 1 okey
"00100000100001000000000000000001",--addi $4 , $4 , 1 okey
"00100000101001011111111111111111",--addi $5 , $5 , -1 okey 
"00010100000001011111111111111010" --bne $5, $0 , okey
);
BEGIN
instr <=imem(to_integer(unsigned(read_addr)));
end arch;