`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/07/2024 11:24:08 AM
// Design Name: 
// Module Name: clk_div
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


module clk_div(
    input clk, rst,
    output clk_en
    );
    reg [23:0] count;                                           //这里测试的时候要改小一点
    always @(posedge clk, posedge rst) begin
        if (rst) count <= 0;
        else count <= count + 1;
    end

    assign clk_en = &count;
endmodule
