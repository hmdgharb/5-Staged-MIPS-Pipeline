library verilog;
use verilog.vl_types.all;
entity HAZARD is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        decoding_op_src1: in     vl_logic_vector(2 downto 0);
        decoding_op_src2: in     vl_logic_vector(2 downto 0);
        decoding_op_dest: in     vl_logic_vector(2 downto 0);
        ex_op_dest      : in     vl_logic_vector(2 downto 0);
        mem_op_dest     : in     vl_logic_vector(2 downto 0);
        wb_op_dest      : in     vl_logic_vector(2 downto 0);
        pipeline_stall_n: out    vl_logic
    );
end HAZARD;
