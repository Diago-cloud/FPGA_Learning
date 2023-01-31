`timescale 1ns/1ns

module TB_Counter_M5 ();

reg clk;
reg rst_n;
wire z;
wire [2:0] qout;

initial begin
    clk<=1'b1;
    rst_n<=1'b0;
    #10
    rst_n<=1'b1;
end

always #20 clk=~clk;

Counter_M5 Counter_M5_inst 
(
    .clk(clk),
    .rst_n(rst_n),
    .z(z),   
    .qout(qout)
);

endmodule