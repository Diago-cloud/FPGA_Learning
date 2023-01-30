`timescale 1ns/1ns

module LED_PWM 
#(
    parameter CNT_1US_MAX = 49,
    parameter CNT_1MS_MAX = 999,
    parameter CNT_1S_MAX = 999
) 
(
    input               clk,
    input               rst_n,
    output reg [3:0]    LED
);

reg [7:0]  cnt_1us;
reg [11:0] cnt_1ms;
reg [11:0]  cnt_1s;
reg         cnt_en;

//1us计数
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        cnt_1us<=0;
    end
    else if (cnt_1us==CNT_1US_MAX) begin
        cnt_1us<=0;
    end
    else begin
        cnt_1us<=cnt_1us+1'b1;
    end
end

//1ms计数
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        cnt_1ms<=0;
    end
    else if ((cnt_1ms==CNT_1MS_MAX)&&(cnt_1us==CNT_1US_MAX)) begin
        cnt_1ms<=0;
    end
    else if (cnt_1us==CNT_1US_MAX) begin
        cnt_1ms<=cnt_1ms+1'b1;
    end

end

//1s计数
always @(posedge clk or negedge rst_n)begin
    if (!rst_n) begin
        cnt_1s<=0;
    end
    else if((cnt_1s==CNT_1S_MAX)&&(cnt_1ms==CNT_1MS_MAX)&&(cnt_1us==CNT_1US_MAX))begin
        cnt_1s<=0;
    end
    else if((cnt_1ms==CNT_1MS_MAX)&&(cnt_1us==CNT_1US_MAX)) begin
        cnt_1s<=cnt_1s+1'b1;
    end
end

always @(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        cnt_en<=0;
    end
    else if((cnt_1s==CNT_1S_MAX)&&(cnt_1ms==CNT_1MS_MAX)&&(cnt_1us==CNT_1US_MAX)) begin
        cnt_en<=~cnt_en;
    end
end

always @(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        LED_PWM<=0;
    end
    else if((cnt_en==1'b0&&cnt_1s<cnt_1ms)||(cnt_en==1'b1&&cnt_1s>cnt_1ms))begin
        LED_PWM<=1'b1;
    end
    else begin
        LED_PWM<=0;
    end
end



endmodule
    