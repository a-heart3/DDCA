`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/06/2024 09:33:11 PM
// Design Name: 
// Module Name: counter
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


module counter #(parameter width = 8) (
    input clk, rst,
    input [width-1:0] in,
    output reg [width-1:0] out
    );

    always @(posedge clk, posedge rst) begin
        if (rst) begin
            out <= 2'b00;
        end
        else begin
            out <= out + 1;
        end
    end

endmodule
