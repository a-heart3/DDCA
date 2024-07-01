`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/01/2024 10:42:35 PM
// Design Name: 
// Module Name: Decoder2_4_tb
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


module Decoder2_4_tb();
reg [1:0] in;
wire [3:0] out;
initial begin
    in = 2'b0;
end
always begin
    #10 in = in + 1;
end

Decoder2_4 Dec (.in(in), .out(out));
endmodule
