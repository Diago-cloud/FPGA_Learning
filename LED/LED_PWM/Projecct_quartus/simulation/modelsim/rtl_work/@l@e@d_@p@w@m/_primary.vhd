library verilog;
use verilog.vl_types.all;
entity LED_PWM is
    generic(
        CNT_1US_MAX     : integer := 49;
        CNT_1MS_MAX     : integer := 999;
        CNT_1S_MAX      : integer := 999
    );
    port(
        clk             : in     vl_logic;
        rst_n           : in     vl_logic;
        LED             : out    vl_logic_vector(3 downto 0)
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of CNT_1US_MAX : constant is 1;
    attribute mti_svvh_generic_type of CNT_1MS_MAX : constant is 1;
    attribute mti_svvh_generic_type of CNT_1S_MAX : constant is 1;
end LED_PWM;
