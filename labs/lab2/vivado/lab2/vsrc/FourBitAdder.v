`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/29/2024 10:03:50 AM
// Design Name: 
// Module Name: FourBitAdder
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


module FourBitAdder(
    input [3:0] a,
    input [3:0] b,
    output [4:0] s
    );
    wire m1, m2, m3;
    FullAdder FA1 (.a(a[0]), .b(b[0]), .ci(1'b0), .s(s[0]), .co(m1));
    FullAdder FA2 (.a(a[1]), .b(b[1]), .ci(m1), .s(s[1]), .co(m2));
    FullAdder FA3 (.a(a[2]), .b(b[2]), .ci(m2), .s(s[2]), .co(m3));
    FullAdder FA4 (.a(a[3]), .b(b[3]), .ci(m3), .s(s[3]), .co(s[4]));
endmodule
