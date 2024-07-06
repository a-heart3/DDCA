`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/06/2024 10:39:56 PM
// Design Name: 
// Module Name: Led75
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


module Led75(
    input clk, rst,
    output led
    );

    wire [1:0] out;
    counter #(2) cont (.clk(clk), .rst(rst), .in(out), .out(out));

    or (led, out[1], out[0]);
endmodule
