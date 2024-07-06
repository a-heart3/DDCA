`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/06/2024 09:12:49 PM
// Design Name: 
// Module Name: Dim_led
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


module Dim_led(
    input clk, rst,
    output led0, led1, led2
    );

    wire [1:0] out0;
    wire out1;
    wire [1:0] out2;
    counter #(2) cont0 (.clk(clk), .rst(rst), .in(out0), .out(out0));
    counter #(1) cont1 (.clk(clk), .rst(rst), .in(out1), .out(out1));
    counter #(2) cont2 (.clk(clk), .rst(rst), .in(out2), .out(out2));

    nand (led0, out0[1], out0[0]);
    and  (led1, out1, 1'b1);
    and  (led2, out2[1], out2[0]);
endmodule
