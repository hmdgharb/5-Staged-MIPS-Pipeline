library verilog;
use verilog.vl_types.all;
entity IF_STAGE is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        instr_fetch_enable: in     vl_logic;
        imm_branch_offset: in     vl_logic_vector(5 downto 0);
        branch_enable   : in     vl_logic;
        jump            : in     vl_logic;
        pc              : out    vl_logic_vector(7 downto 0);
        instr           : out    vl_logic_vector(15 downto 0)
    );
end IF_STAGE;
