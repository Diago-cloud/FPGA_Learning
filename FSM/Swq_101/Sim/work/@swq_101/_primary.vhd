library verilog;
use verilog.vl_types.all;
entity Swq_101 is
    port(
        clk             : in     vl_logic;
        rst_n           : in     vl_logic;
        x               : in     vl_logic;
        y               : out    vl_logic
    );
end Swq_101;
