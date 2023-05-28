library ieee;
use ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.numeric_std.ALL;

entity mips is
port(clk1 : in std_logic ;
reset1 : in std_logic);
end mips;

architecture dataflow of mips is

component pc is port (reset: in std_logic; pc1: in std_logic_vector(31 downto 0); addr: out std_logic_vector(31 downto 0));
end component;

component instrmemory is port (addr: in std_logic_vector(31 downto 0); instr: out std_logic_vector(31 downto 0));
end component;

component regfile1 is port (rAddr1: in std_logic_vector(4 downto 0); rAddr2: in std_logic_vector(4 downto 0);wAddr : in std_logic_vector(4 downto 0);
writedata : in std_logic_vector(31 downto 0); readdata1 : out std_logic_vector(31 downto 0);
readdata2: out std_logic_vector(31 downto 0); regwrite , reset  , clk : in std_logic);
end component;

component controller is port (opcode : IN std_logic_vector(5 DOWNTO 0); 
		regdst        : OUT std_logic;
		jump          : OUT std_logic;
		branch        : OUT std_logic;
		memread       : OUT std_logic;
		memtoregister : OUT std_logic;
		aluop         : OUT std_logic_vector(1 DOWNTO 0);
		memwrite      : OUT std_logic;
		alusrc        : OUT std_logic;
		regwrite      : OUT std_logic);
end component;



signal pc2 ,addr1 , addr2 , instr1 : std_logic_vector(31 downto 0) ;
signal rAddr11 , rAddr12 , wAddr1 : std_logic_vector(4 downto 0) ;
signal writedata1 , readdata12 , readdata11 : std_logic_vector(31 downto 0) ;
signal regwrite1 : std_logic;

begin 
pcounter: pc port map (pc1 => pc2 ,addr => addr1 , reset=>reset1);

instruction_mem : instrmemory port map(addr=>addr2 , instr=>instr1);

registerfile : regfile1 port map (writedata =>writedata1 , readdata2 => readdata12 , readdata1 => readdata11,
rAddr1=>rAddr11 , rAddr2=>rAddr12 , wAddr=> wAddr1 , reset => reset1  , clk=> clk1 , regwrite=> regwrite1); 

controll: controller port map(opcode => addr2(31 downto 26)

--process
--begin
--end process;
end dataflow;