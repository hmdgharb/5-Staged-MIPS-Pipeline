library verilog;
use verilog.vl_types.all;
entity MUX2 is
    generic(
        SIZE            : integer := 4
    );
    port(
        SLCT            : in     vl_logic;
        IN1             : in     vl_logic_vector;
        IN0             : in     vl_logic_vector;
        OT              : out    vl_logic_vector
    );
end MUX2;
