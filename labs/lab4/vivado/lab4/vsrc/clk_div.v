`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/04/2024 08:36:05 PM
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
    reg [24:0] clk_count;
    always @(posedge clk) begin
        if (rst) begin
            clk_count <= 0;
        end
        else begin
            clk_count <= clk_count + 1; 
        end
    end
    assign clk_en = &clk_count;
endmodule
