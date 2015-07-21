library verilog;
use verilog.vl_types.all;
entity PC is
    port(
        clock           : in     vl_logic;
        reset           : in     vl_logic;
        PCEn            : in     vl_logic;
        \in\            : in     vl_logic_vector(7 downto 0);
        \out\           : out    vl_logic_vector(7 downto 0)
    );
end PC;
