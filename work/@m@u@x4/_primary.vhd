library verilog;
use verilog.vl_types.all;
entity MUX4 is
    generic(
        SIZE            : integer := 8
    );
    port(
        SLCT            : in     vl_logic_vector(1 downto 0);
        IN3             : in     vl_logic_vector;
        IN2             : in     vl_logic_vector;
        IN1             : in     vl_logic_vector;
        IN0             : in     vl_logic_vector;
        OT              : out    vl_logic_vector
    );
end MUX4;
