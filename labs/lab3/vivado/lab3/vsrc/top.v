`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/01/2024 09:03:13 PM
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
    input [3:0] a,
    input [3:0] b,
    output overflow,
    output [6:0] D,
    output [3:0] AN,
    input [1:0] sel
    );
    wire [4:0] addres;
    FourBitAdder FBA (.a(a), .b(b), .s(addres));
    seg7 seg_7 (.in(addres[3:0]), .out(D));
    assign overflow = addres[4];
    Decoder2_4 Dec (.in(sel), .out(AN));
endmodule
