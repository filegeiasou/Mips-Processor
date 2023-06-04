library ieee;
use ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.numeric_std.ALL;

entity mips is
port(clk1 : in std_logic ;
reset1 : in std_logic);
end mips;

architecture dataflow of mips is
component pc is port (pc_in : in std_logic_vector(31 downto 0);
pc_out : out std_logic_vector (31 downto 0);
rst : in std_logic);
end component;

component instrmemory is port (read_addr: in std_logic_vector(31 downto 0);
instr : out  std_logic_vector(31 downto 0));
end component;

component regfile1 is generic ( dw : natural := 32;
adrw : natural := 5);
port (rreg1: in std_logic_vector(adrw-1 downto 0);
rreg2: in std_logic_vector(adrw-1 downto 0);
wreg : in std_logic_vector(adrw-1 downto 0);
regwrite1 ,rst1  , clk : in std_logic;
writedatareg : in std_logic_vector(dw-1 downto 0);
readdata1 : out std_logic_vector(dw-1 downto 0);
readdata2: out std_logic_vector(dw-1 downto 0));
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
		regwrite      : OUT std_logic;
		rst2          : in std_logic);
end component;

component mux5 is port (read20_16, read15_11: in std_logic_vector(4 downto 0);
regdst2: in std_logic;
writereg: out std_logic_vector(4 downto 0));
end component;

component signex is port (read15_0: in std_logic_vector(15 downto 0);
signext: out std_logic_vector(31 downto 0));
end component;

component mux32 is port(a, b: in std_logic_vector(31 downto 0);
ch: in std_logic;
c: out std_logic_vector(31 downto 0));
end component;

component alu is port (readreg1, re_mux: in std_logic_vector(31 downto 0);
zero: out std_logic;
alu_ctr1 : in std_logic_vector(2 downto 0);
alu_res: out std_logic_vector(31 downto 0));
end component;

component alu_ctl is port (aluop1 : in std_logic_vector (1 downto 0);
inst5_0 : in std_logic_vector (5 downto 0);
alu_ctr : out std_logic_vector(2 downto 0));
end component;

component datamem is port
(alu_rlt: in std_logic_vector(31 downto 0);
readreg2: in std_logic_vector(31 downto 0);
memread1   : IN std_logic;
memwrite1  : IN std_logic;
readdata_d: out std_logic_vector(31 downto 0));
end component;

--signals for pc
signal pc_in1  , pc_out1 : std_logic_vector(31 downto 0);
signal reset2 , clock : std_logic;

--signals for instr_memo
signal read_addr1 ,instr1 : std_logic_vector(31 downto 0);

--signals for controller
signal  branch1 , memread2 , memtoregister1 , memwrite2 , alusrc1 , regwrite2 , regdst1 :   std_logic;
signal aluop2 : std_logic_vector(1 downto 0);
signal opcode1 : std_logic_vector(5 downto 0);

--signals for register file
signal rreg11 , rreg21 , wreg1 : std_logic_vector(4 downto 0);
signal writedatareg1 , readdata21, readdata11 : std_logic_vector(31 downto 0);

--signals for mux5
signal read20_16_1 , read15_11_1  ,  writereg1: std_logic_vector(4 downto 0);

--signals for signex
signal read15_0_1 : std_logic_vector(15 downto 0);
signal signext1: std_logic_vector(31 downto 0);

--signals for alu control
signal aluop2 : std_logic_vector(1 downto 0);
signal aluct_1: std_logic_vector(2 downto 0);

--signals for alu
signal alu_res1: std_logic_vector(31 downto 0);
signal re_mux1: std_logic_vector (31 downto 0);
signal zero1 :std_logic;

--signals for data memory
signal readdata_d1 : std_logic_vector(31 downto 0);

--signals mux 2 32
signal a1 , b1 : std_logic_vector(31 downto 0);
signal mux_re : std_logic_vector(31 downto 0);


begin 
programcounter : pc port map(pc_in=>pc_in1 , pc_out=>pc_out1 , rst=>reset2);
process(reset1,clk1)
begin
if(reset1='1') then 
reset2<='1';
elsif(clk1'event and clk1='1') then
--pc_in1<= pc_in1 + x"0001" ;
clock<='1';
end if;

end process;

--pc_in1<= pc_in1 + x"0001" ;

instructionmem : instrmemory port map(read_addr=> read_addr1  ,instr=>instr1);
read_addr1 <= pc_in1;

controll : controller port map(opcode=>opcode1 ,branch=>branch1 , memread=>memread2 , memtoregister=>memtoregister1 ,regdst=>regdst1, aluop=>aluop2 , memwrite=>memwrite2 , alusrc=>alusrc1 , regwrite=> regwrite2, rst2=>reset2 );
opcode1<=instr1(31 downto 26) ;

registerfile: regfile1 port map(rreg1=>rreg11 , rreg2=>rreg21 , wreg=> wreg1, regwrite1=>regwrite2 , writedatareg=> writedatareg1 , readdata1=> readdata11 , readdata2=> readdata21 , rst1=>reset2 , clk=>clock);
--clock up
rreg11<=instr1(25 downto 21) ;
rreg12<=instr1(20 downto 16) ;

mux2t01 : mux5 port map(read20_16=>read20_16_1 , read15_11=>read15_11_1 , regdst2=> regdst1 , writereg=>wreg1);
if(regdst1='1') then
read15_11_1<=instr1(15 downto 11) ;
else
read20_16_1<= instr1(20 downto 16) ;
end if;

if(regwrite2='1' and regdst1='1')then
wreg1<=read15_11_1;
elsif(regwrite2='1' and regdst1='0')then
wreg1<=read20_16_1;
end if;

signextend: signex port map(read15_0=> read15_0_1 , signext=> signext1);
read15_0_1<=instr1(15 downto 0) ;

aluContr: alu_ctl port map(aluop1=>aluop2 , inst5_0=>instr1(5 downto 0) , alu_ctr=>aluct_1 );

mux132: mux32 port map(a=>readdata21 , b=>signext1 , ch=>aluarc1 , c=>re_mux1);

alus: alu port map(readreg1=>readdata11 , re_mux=> re_mux1 , alu_ctr1=>aluct_1 , alu_res=>alu_res1 , zero=>zero1);
	
datame : datamem port map(alu_rlt=>alu_res1 , readreg2=>readdata21 , memwrite1 => memwrite2 , memread1=> memread1 , readdata_d=> readdata_d1);

mux232 : mux32 port map(a=>alu_res1 , b=>readdata_d1 , ch=>memtoregister1 , c=>mux_re);
writedatareg1<=mux_re;	

end dataflow;
