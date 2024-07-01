`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/01/2024 10:37:17 PM
// Design Name: 
// Module Name: Decoder2_4
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


module Decoder2_4(
    input [1:0] in,
    output reg [3:0] out
    );

    always @(*) begin
        case (in)
          2'b00: out = 4'b1110;
          2'b01: out = 4'b1101;
          2'b10: out = 4'b1011;
          2'b11: out = 4'b0111;
        endcase
    end
endmodule
