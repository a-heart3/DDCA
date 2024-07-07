`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/07/2024 09:41:42 AM
// Design Name: 
// Module Name: led75
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


module led75(
    input clk, rst,
    output led
    );

    wire [1:0] out;
    counter #(2) cont (.clk(clk), .rst(rst), .out(out));
    assign led = |out;
endmodule
