`timescale 1ns/1ns

module Seq_101
#(
    parameter S0=2'b00,
    parameter S1=2'b01,
    parameter S2=2'b11,
    parameter S3=2'b10
)
(
    input       clk,
    input       rst_n,
    input       x,
    output reg  y
);

reg [1:0] current_state,next_state;

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        current_state<=S0;
    end
    else begin
        current_state<=next_state;        
    end
end

always @(current_state or x) begin
    case (current_state)
        S0:begin
            if(x)   next_state<=S1;
            else    next_state<=S0;
        end
        S1:begin
            if(x)   next_state<=S1;
            else    next_state<=S2;
        end
        S2:begin
            if(x)   next_state<=S3;
            else    next_state<=S0;
        end
        S3:begin
            if(x)   next_state<=S1;
            else    next_state<=S2;
        end
        default :   next_state<=S0;
    endcase
end

always @(*) begin
    case (current_state)
        S3:y=1'b1;
        default :y=1'b0;
    endcase
end
    
endmodule