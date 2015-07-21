library verilog;
use verilog.vl_types.all;
entity IF_ID is
    port(
        clock           : in     vl_logic;
        reset           : in     vl_logic;
        \In\            : in     vl_logic_vector(15 downto 0);
        InEnable        : in     vl_logic;
        \Out\           : out    vl_logic_vector(15 downto 0)
    );
end IF_ID;
