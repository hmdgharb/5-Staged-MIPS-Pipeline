library verilog;
use verilog.vl_types.all;
entity ALU is
    port(
        a               : in     vl_logic_vector(15 downto 0);
        b               : in     vl_logic_vector(15 downto 0);
        cmd             : in     vl_logic_vector(3 downto 0);
        rLeft           : out    vl_logic_vector(15 downto 0);
        rRight          : out    vl_logic_vector(15 downto 0);
        zero            : out    vl_logic
    );
end ALU;
