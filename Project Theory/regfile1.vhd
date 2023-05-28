library ieee;
use ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.numeric_std.ALL;
entity regfile1 is
generic ( dw : natural := 32;
adrw : natural := 5);
port (
rAddr1: in std_logic_vector(adrw-1 downto 0);
rAddr2: in std_logic_vector(adrw-1 downto 0);
wAddr : in std_logic_vector(adrw-1 downto 0);
regwrite ,reset  , clk : in std_logic;
writedata : in std_logic_vector(dw-1 downto 0);
readdata1 : out std_logic_vector(dw-1 downto 0);
readdata2: out std_logic_vector(dw-1 downto 0));
end regfile1;

architecture behavioral of regfile1 is

type regArray is array(0 to 15) of std_logic_vector(dw-1 downto 0);
signal regfile1 : regArray;

begin
process(clk,reset)
begin
if(reset='1') then
regfile1(0) <= x"00000000";
regfile1(1) <= x"00000001";
regfile1(2) <= x"00000002";
regfile1(3) <= x"00000003";
regfile1(4) <= x"00000004";
regfile1(5) <= x"00000005";
regfile1(6) <= x"00000006";
regfile1(7) <= x"00000007";
regfile1(8) <= x"00000008";
regfile1(9) <= x"00000009";
regfile1(10) <= x"0000000A";
regfile1(11) <= x"0000000B";
regfile1(12) <= x"0000000C";
regfile1(13) <= x"0000000D";
regfile1(14) <= x"0000000E";
regfile1(15) <= x"0000000F";


		elsif (regwrite='1' and clk'event and clk='1') then
			
				regfile1(to_integer(unsigned(wAddr))) <= writedata;
			
		end if;
	readdata1 <= regfile1(to_integer(unsigned(rAddr1)));
	readdata2 <= regfile1(to_integer(unsigned(rAddr2)));
end process;
end behavioral;