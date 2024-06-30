`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/30/2024 08:56:57 PM
// Design Name: 
// Module Name: tmux_4_1
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


module tmux_4_1(
    input [3:0] a,
    input [1:0] s,
    output result
    );
    wire m1, m2;
    multiplexer_2_1 g1 (.a(a[2]), .b(a[3]), .s(s[0]), .result(m1));
    multiplexer_2_1 g2 (.a(a[0]), .b(a[1]), .s(s[0]), .result(m2));
    multiplexer_2_1 g3 (.a(m2), .b(m1), .s(s[1]), .result(result));
endmodule
