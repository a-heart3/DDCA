`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/29/2024 10:00:57 AM
// Design Name: 
// Module Name: FullAdder
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


module FullAdder(
    input a,
    input b,
    input ci,
    output s,
    output co
    );
    wire m1, m2, m3;
    xor (m1, a, b);             //a ^ b              详见logisim和md文件分析
    and (m2, a, b);             //a & b
    and (m3, m1, ci);           //m1 & ci
    xor (s, ci, m1);
    or (co, m3, m2);
endmodule
