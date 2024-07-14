`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/09/2024 08:37:02 PM
// Design Name: 
// Module Name: ALU
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


module ALU(
    input [31:0] A, B,
    input [3:0] aluop,
    output [31:0] result
    );

    wire [31:0] result_alu, result_log;                                         //选择逻辑输出还是算术输出
    ArithOut AO (.A(A), .B(B), .aluop(aluop), .result(result_alu));
    LogicOut LO (.A(A), .B(B), .aluop(aluop), .result(result_log));

    assign result = (aluop[2]) ? (result_log) : (result_alu);
endmodule
