`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/07/2024 09:34:26 AM
// Design Name: 
// Module Name: counter_tb
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


module counter_tb();
reg clk, rst;
wire [1:0] out;
initial begin
    rst = 1;
    clk = 0;
    #10 rst = 0;
end

always begin
    #5 clk = ~clk;
end

counter #(2) cont (.clk(clk), .rst(rst), .out(out));
endmodule
