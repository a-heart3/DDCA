`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/04/2024 09:15:24 PM
// Design Name: 
// Module Name: top_tb
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


module top_tb();
reg left, right, clk, rst;
wire [5:0] leds;

initial begin
    rst = 1;
    clk = 0;
    left = 1;
    right = 1;
    #10 rst = 0;
end

always begin
    #5 clk = ~clk;    
end

top tp (.left(left), .right(right), .clk(clk), .rst(rst), .leds(leds));
endmodule
