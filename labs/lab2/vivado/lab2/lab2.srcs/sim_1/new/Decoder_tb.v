`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/30/2024 09:59:30 AM
// Design Name: 
// Module Name: Decoder_tb
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


module Decoder_tb();
reg a, b;
wire o, o1, o2, o3;
initial begin
    a = 1'b0;
    b = 1'b0;
end
always begin
    #10 a = a + 1;
    #10 a = 1'b0; b = b + 1;
    #10 a = a + 1;
end
    Decoder De (.a(a), .b(b), .o(o), .o1(o1), .o2(o2), .o3(o3));
endmodule
