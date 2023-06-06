library ieee;
use ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.numeric_std.ALL;
entity regfile1 is
generic ( dw : natural := 32;
adrw : natural := 5);
port (
rreg1: in std_logic_vector(adrw-1 downto 0);
rreg2: in std_logic_vector(adrw-1 downto 0);
wreg : in std_logic_vector(adrw-1 downto 0);
regwrite1 ,rst1  , clk : in std_logic;
writedatareg : in std_logic_vector(dw-1 downto 0);
readdata1 : out std_logic_vector(dw-1 downto 0);
readdata2: out std_logic_vector(dw-1 downto 0));
end regfile1;

architecture behavioral of regfile1 is

type regArray is array(0 to 15) of std_logic_vector(dw-1 downto 0);
signal regfile1 : regArray;

begin
process(clk,rst1,regwrite1)
begin
if(rst1='1') then
for i in 0 to (15) loop
	regfile1(i) <= (others =>'0');
end loop;
		elsif (regwrite1='1' and clk'event and clk='1') then
			
				regfile1(to_integer(unsigned(wreg))) <= writedatareg;
			
		end if;
end process;
	readdata1 <= regfile1(to_integer(unsigned(rreg1)));
	readdata2 <= regfile1(to_integer(unsigned(rreg2)));

end behavioral;