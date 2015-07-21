library verilog;
use verilog.vl_types.all;
entity ID_stage is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        ID_RegWriteEn   : in     vl_logic;
        ID_RegWriteDest : in     vl_logic_vector(2 downto 0);
        ID_RegWriteData : in     vl_logic_vector(15 downto 0);
        ID_In           : in     vl_logic_vector(15 downto 0);
        ID_AluSrc1      : out    vl_logic_vector(15 downto 0);
        ID_AluSrc2      : out    vl_logic_vector(15 downto 0);
        ID_MemWriteData : out    vl_logic_vector(15 downto 0);
        ID_RFWriteBackDest: out    vl_logic_vector(2 downto 0);
        ID_MemWriteEn   : out    vl_logic;
        ID_WriteBackResultMux: out    vl_logic;
        ID_RFWriteBackEn: out    vl_logic;
        ID_ALUCmd       : out    vl_logic_vector(3 downto 0);
        ID_jump         : out    vl_logic;
        ID_branch       : out    vl_logic
    );
end ID_stage;
