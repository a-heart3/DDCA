`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/30/2024 11:06:58 AM
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
    input [3:0] adda, 
    input [3:0] addb,
    input deca, decb,
    input [2:0] tmuxs,
    output [4:0] adds,
    output deco, deco1, deco2, deco3,
    output tmuxr
    );
    FourBitAdder FBA (.a(adda), .b(addb), .s(adds));
    Decoder Dec (.a(deca), .b(decb), .o(deco), .o1(deco1), .o2(deco2), .o3(deco3));
    tmux_4_1 tmux1 (.a(adda), .s(tmuxs), .result(tmuxr));
endmodule

/*
在编写tmux的时候，复用了adder的输入a，不用再写4路选择器的输入的端口了
*/