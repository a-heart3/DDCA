`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/29/2024 10:49:15 AM
// Design Name: 
// Module Name: Adder_tb
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


module Adder_tb();
reg [3:0] a;
reg [3:0] b;
wire [4:0] s;

initial begin
    a = 4'b0;
    b = 4'b0;
end
always begin
    #10
    a = a + 1;
    b = b + 1;
end

FourBitAdder my_adder (
    .a(a),
    .b(b),
    .s(s)
);
endmodule
