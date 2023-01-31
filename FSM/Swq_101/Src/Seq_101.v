`timescale 1ns/1ns

module Swq_101
(
    input       clk,
    input       rst_n,
    input       x,
    output reg  y
);
    
reg [1:0] state;

localparam S0=2'b00;
localparam S1=2'b01;
localparam S2=2'b11;
localparam S3=2'b10;

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        state<=S0;
    end
    else begin
        case(state)
        S0:begin
            if(x)   state<=S1;
            else    state<=S0;
        end
        S1:begin
            if(x)   state<=S1;
            else    state<=S2;
        end
        S2:begin
            if(x)   state<=S3;
            else    state<=S0;
        end
        S3:begin
            if(x)   state<=S1;
            else    state<=S2;
        end
        default:    state<=S0;
        endcase
    end
end

always @(state) begin
    case (state)
        S3:y=1'b1;
        default :y=1'b0;
    endcase
end


endmodule