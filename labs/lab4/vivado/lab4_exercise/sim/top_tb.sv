`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/07/2024 12:01:37 PM
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
reg clk, rst, left, right;
wire LC, LB, LA, RA, RB, RC;
initial begin
    clk = 0;
    rst = 1;
    left = 0;
    right = 0;
    #10 rst = 0;
    left = 1;
end

always begin
    #5 clk = ~clk;
end
top tp (.clk(clk), .rst(rst), .left(left), .right(right), .LC(LC), .LB(LB), .LA(LA), .RA(RA), .RB(RB), .RC(RC));
endmodule
