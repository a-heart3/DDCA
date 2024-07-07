`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/07/2024 11:00:53 AM
// Design Name: 
// Module Name: led_dim
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module led_dim(
    input [1:0] sel,                    //选择灯的亮度
    input clk, rst,                     //连接灯的信号
    output reg led                      
    );
    wire led50, led75;
    always @(*) begin
        /*
        if (rst) begin
            led = 0;
        end
        */                            //没有必要rst这里，因为rst后输入状态必为0,所以所有灯都为0
        case (sel)
            2'b00: led = 0;
            2'b01: led = led50;
            2'b10: led = led75;
            2'b11: led = 1;
        endcase
    end

    led50 ld50 (.clk(clk), .rst(rst), .led(led50));
    led75 ld75 (.clk(clk), .rst(rst), .led(led75));
endmodule
