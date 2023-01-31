`timescale 1ns/1ns

module Counter_M5 
(
    input               clk,
    input               rst_n,
    output reg          z,   
    output reg [2:0]    qout
);

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        qout<=0;
    end
    else
        begin
            case(qout)
            3'b000:begin qout<=3'b001;z=1'b0;end
            3'b001:begin qout<=3'b010;z=1'b0;end
            3'b010:begin qout<=3'b011;z=1'b0;end
            3'b011:begin qout<=3'b100;z=1'b1;end
            3'b100:begin qout<=3'b000;z=1'b0;end
            default:begin qout<=3'b000;z=1'b0;end
            endcase
        end
end
    
endmodule