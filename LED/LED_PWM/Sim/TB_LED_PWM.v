`timescale 1ns/1ns

module TB_LED_PWM ();

reg         clk;
reg         rst_n;
wire [3:0]  LED;

initial begin
    clk=1'b1;
    rst_n<=1'b0;
    #20
    rst_n<=1'b1;
end

always #10 clk=~clk;

LED_PWM 
#(
    .CNT_1US_MAX(6'd4),
    .CNT_1MS_MAX(10'd9),
    .CNT_1S_MAX (10'd9)
)
LED_PWM_inst 
(
    .clk(clk),
    .rst_n(rst_n),
    .LED(LED)
);




endmodule
