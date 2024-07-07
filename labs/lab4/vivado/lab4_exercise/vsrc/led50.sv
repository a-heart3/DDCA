`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/07/2024 09:39:13 AM
// Design Name: 
// Module Name: led50
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


module led50(
    input rst, clk,
    output led
    );
    wire out;
    counter #(1) cont (.clk(clk), .rst(rst), .out(out));
    assign led = out;
endmodule
