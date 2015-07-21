library verilog;
use verilog.vl_types.all;
entity MEM_stage is
    port(
        rst             : in     vl_logic;
        DataMemoryAddress: in     vl_logic_vector(15 downto 0);
        DataMemoryWriteData: in     vl_logic_vector(15 downto 0);
        DataMemoryWriteEnable: in     vl_logic;
        DataMemoryOut   : out    vl_logic_vector(15 downto 0)
    );
end MEM_stage;
