`timescale 1ns/1ns

module TB_Seq_101 ();
    
reg     clk;
reg     rst_n;
reg     x;
wire    y;

initial begin
    clk<=1'b1;
    rst_n<=1'b0;
    #10
    rst_n<=1'b1;
end

always #20  clk<=~clk;
always #10  x<={$random}%2;

initial $monitor("x=%d @time %d",x,$time);

Seq_101
#(
    .S0(2'b00),
    .S1(2'b01),
    .S2(2'b11),
    .S3(2'b10)
)
Seq_101_inst
(
    .clk(clk),
    .rst_n(rst_n),
    .x(x),
    .y(y)
);




endmodule