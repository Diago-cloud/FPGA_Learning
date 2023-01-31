library verilog;
use verilog.vl_types.all;
entity Seq_101 is
    generic(
        S0              : vl_logic_vector(0 to 1) := (Hi0, Hi0);
        S1              : vl_logic_vector(0 to 1) := (Hi0, Hi1);
        S2              : vl_logic_vector(0 to 1) := (Hi1, Hi1);
        S3              : vl_logic_vector(0 to 1) := (Hi1, Hi0)
    );
    port(
        clk             : in     vl_logic;
        rst_n           : in     vl_logic;
        x               : in     vl_logic;
        y               : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of S0 : constant is 1;
    attribute mti_svvh_generic_type of S1 : constant is 1;
    attribute mti_svvh_generic_type of S2 : constant is 1;
    attribute mti_svvh_generic_type of S3 : constant is 1;
end Seq_101;
