`timescale 1ns / 1ps
`define clk_cycle 1             //设计时钟周期
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/04/2024 08:40:28 PM
// Design Name: 
// Module Name: clk_div_tb
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


module clk_div_tb();
reg clk, rst;
wire clk_en;
initial begin
    rst = 1'b1;
    clk = 1'b0;
    #10 rst = 1'b0;
end
always begin
    # (`clk_cycle);
    clk = ~clk;
end
clk_div cd (.clk(clk), .rst(rst), .clk_en(clk_en));
endmodule
