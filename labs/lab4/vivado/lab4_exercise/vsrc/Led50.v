`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/06/2024 10:29:52 PM
// Design Name: 
// Module Name: Led50
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


module Led50(
    input clk, rst,
    output led
    );

    wire out;
    counter #(1) cont (.clk(clk), .rst(rst), .in(out), .out(out));
    and (led, out, 1'b1);
endmodule