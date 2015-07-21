library verilog;
use verilog.vl_types.all;
entity CONTROLLER is
    port(
        clock           : in     vl_logic;
        \In\            : in     vl_logic_vector(15 downto 0);
        Zero            : in     vl_logic;
        alu_cmd         : out    vl_logic_vector(3 downto 0);
        rf_write_back_en: out    vl_logic;
        write_back_result_mux: out    vl_logic;
        mem_write_en    : out    vl_logic;
        rf_write_dest_mux: out    vl_logic;
        add_2_mux       : out    vl_logic;
        data_2_mux      : out    vl_logic;
        mem_write_mux   : out    vl_logic;
        branchEn        : out    vl_logic;
        jump            : out    vl_logic
    );
end CONTROLLER;
