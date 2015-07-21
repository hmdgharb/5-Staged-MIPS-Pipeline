library verilog;
use verilog.vl_types.all;
entity EX_STAGE is
    port(
        EX_AluCmd       : in     vl_logic_vector(3 downto 0);
        EX_AluSrc1      : in     vl_logic_vector(15 downto 0);
        EX_AluSrc2      : in     vl_logic_vector(15 downto 0);
        zeroFlag        : out    vl_logic;
        EX_LowResult    : out    vl_logic_vector(15 downto 0)
    );
end EX_STAGE;
