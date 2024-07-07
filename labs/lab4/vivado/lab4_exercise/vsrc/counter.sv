`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/07/2024 09:28:06 AM
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
    input rst, clk,
    //input wire [width-1:0] in,
    output reg [width-1:0] out
    );

    always @(posedge clk, posedge rst) begin
        if (rst) begin
            out <= 0;
        end
        else begin
            out <= out + 1;            
        end
    end

endmodule
