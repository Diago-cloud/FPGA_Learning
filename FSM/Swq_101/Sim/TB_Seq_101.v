`timescale 1ns/1ns

module TB_Seq_101();

reg         clk;
reg         rst_n;
reg         x;
wire        y;

initial begin
    clk<=1'b1;
    rst_n<=1'b0;
    #10
    rst_n<=1'b1;
end

always #20  clk<=~clk;
always #20  x<={$random}%2;

Swq_101 Swq_101_inst
(
        .clk(clk),
        .rst_n(rst_n),
        .x(X),
        .y(y)
);


endmodule