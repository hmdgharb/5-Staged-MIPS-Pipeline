library verilog;
use verilog.vl_types.all;
entity ID_EX is
    port(
        clock           : in     vl_logic;
        reset           : in     vl_logic;
        ex_alu_cmd      : in     vl_logic_vector(3 downto 0);
        ex_alu_src1     : in     vl_logic_vector(15 downto 0);
        ex_alu_src2     : in     vl_logic_vector(15 downto 0);
        mem_write_en    : in     vl_logic;
        mem_write_data  : in     vl_logic_vector(15 downto 0);
        write_back_en   : in     vl_logic;
        write_back_dest : in     vl_logic_vector(2 downto 0);
        write_back_result_mux: in     vl_logic;
        stall           : in     vl_logic;
        RegIDToExOut    : out    vl_logic_vector(57 downto 0)
    );
end ID_EX;
