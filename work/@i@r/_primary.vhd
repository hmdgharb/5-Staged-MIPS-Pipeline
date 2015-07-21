library verilog;
use verilog.vl_types.all;
entity IR is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        aluLeftCondition: in     vl_logic_vector(16 downto 0);
        rg_wrt_enable   : in     vl_logic;
        rg_wrt_dest     : in     vl_logic_vector(2 downto 0);
        rg_wrt_data     : in     vl_logic_vector(15 downto 0);
        rg_rd_addr1     : in     vl_logic_vector(2 downto 0);
        rg_rd_data1     : out    vl_logic_vector(15 downto 0);
        rg_rd_addr2     : in     vl_logic_vector(2 downto 0);
        rg_rd_data2     : out    vl_logic_vector(15 downto 0)
    );
end IR;
