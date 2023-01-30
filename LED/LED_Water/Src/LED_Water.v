`timescale 1ns/1ns

module LED_Water 
#(
    parameter COUNT_1S=28'd49_999_999,
    parameter COUNT_2S=28'd99_999_999, 
    parameter COUNT_3S=28'd149_999_999, 
    parameter COUNT_4S=28'd199_999_999 
)
(
    input            clk,
    input            rst_n,
    output reg [3:0] LED
);

reg [27:0]  counter;
    
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) 
        counter<=0;
    else if (counter==COUNT_4S) 
        counter<=0;
    else 
        counter<=counter+1'b1;
end

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) 
        LED<=0;   
    else if (counter==COUNT_1S) 
        LED<=4'b1000;   
    else if (counter==COUNT_2S) 
        LED<=4'b0100;   
    else if (counter==COUNT_3S)
        LED<=4'b0010;    
    else if (counter==COUNT_4S)
        LED<=4'b0001;    
end

endmodule
