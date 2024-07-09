`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/09/2024 12:27:25 PM
// Design Name: 
// Module Name: ArithOut
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


module ArithOut(
    input [31:0] A, B,
    input [3:0] aluop,
    output [31:0] result
    );
    wire [31:0] result1;
    Adder add (.A(A), .B(B), .sel(aluop[1]), .result(result1));
    assign result = (aluop[3]) ? {32{result1[31]}} : result1;                       //判断ALU最高位为1, 输出比较结果(符号位)，需要扩展到32位， 否则，输出计算结果
endmodule
