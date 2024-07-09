`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/09/2024 12:20:16 PM
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
reg [31:0] A, B;
wire [31:0] result;
reg sel;

initial begin
    A = 0;
    B = 0;
    sel = 0;
end

always begin
    #5 A = A + 3;
    B = B + 1;
    #2 sel = sel + 1;
end

Adder add (.A(A), .B(B), .sel(sel), .result(result));
endmodule
