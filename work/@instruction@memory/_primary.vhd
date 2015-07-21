library verilog;
use verilog.vl_types.all;
entity InstructionMemory is
    generic(
        SIZE            : integer := 256
    );
    port(
        reset           : in     vl_logic;
        addr            : in     vl_logic_vector(7 downto 0);
        inst            : out    vl_logic_vector(15 downto 0)
    );
end InstructionMemory;
