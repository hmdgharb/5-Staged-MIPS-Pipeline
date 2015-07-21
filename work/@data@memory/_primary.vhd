library verilog;
use verilog.vl_types.all;
entity DataMemory is
    generic(
        SIZE            : integer := 256
    );
    port(
        MemWriteEn      : in     vl_logic;
        reset           : in     vl_logic;
        address         : in     vl_logic_vector(15 downto 0);
        writeData       : in     vl_logic_vector(15 downto 0);
        ReadData        : out    vl_logic_vector(15 downto 0)
    );
end DataMemory;
