library verilog;
use verilog.vl_types.all;
entity WB_STAGE is
    port(
        pipeline_reg_in : in     vl_logic_vector(36 downto 0);
        Reg_write_en    : out    vl_logic;
        Reg_write_dest  : out    vl_logic_vector(2 downto 0);
        Reg_write_data  : out    vl_logic_vector(15 downto 0)
    );
end WB_STAGE;
