`timescale  1ns / 1ns   

`include "Counter_M5.v"

module tb_Counter_M5;   

// Counter_M5 Parameters
parameter PERIOD  = 10; 


// Counter_M5 Inputs    
reg   clk                                  = 0 ;
reg   rst_n                                = 0 ;

// Counter_M5 Outputs
wire  z                                    ;
wire  [2:0]  qout                          ;

Counter_M5  u_Counter_M5 (
    .clk                     ( clk          ),
    .rst_n                   ( rst_n        ),

    .z                       ( z            ),
    .qout                    ( qout   [2:0] )
);
initial begin    
    clk<=1'b1;
    rst_n<=1'b0;
    #10
    rst_n<=1'b1;    
end

always #20 clk=~clk;

initial
begin

    $dumpfile("Counter_M5.vcd");
    $dumpvars;
    $finish;
end



endmodule