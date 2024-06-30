`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/30/2024 11:15:05 AM
// Design Name: 
// Module Name: top_tb
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


module top_tb();
reg [3:0] adda;
reg [3:0] addb;
reg [1:0] tmuxs;
wire [4:0] adds;
reg deca, decb;
wire deco, deco1, deco2, deco3;
wire tmuxr;
initial begin
    adda = 4'b0;
    addb = 4'b0;
    deca = 1'b0;
    decb = 1'b0;
    tmuxs = 1'b0; 
end
always begin
    #10
    adda = adda + 1;
    deca = deca + 1;
    tmuxs = tmuxs + 1;
    #20 
    addb = addb + 1;
    deca = 1'b0;
    decb = decb + 1;
    #30
    deca = deca + 1;
end
FourBitAdder FBA (.a(adda), .b(addb), .s(adds));
Decoder DEC (.a(deca), .b(decb), .o(deco), .o1(deco1), .o2(deco2), .o3(deco3));
tmux_4_1 tmux1 (.a(adda), .s(tmuxs), .result(tmuxr));
endmodule
