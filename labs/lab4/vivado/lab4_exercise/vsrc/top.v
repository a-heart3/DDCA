`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/06/2024 10:43:27 PM
// Design Name: 
// Module Name: top
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


module top(
    input clk, rst,
    output led0, led1, led2
    );

    Led50 l50 (.clk(clk), .rst(rst), .led(led0));
    Led75 l75 (.clk(clk), .rst(rst), .led(led1));
    or (led2, 1'b1, 1'b1);
endmodule
