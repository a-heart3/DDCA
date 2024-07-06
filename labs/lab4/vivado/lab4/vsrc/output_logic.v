`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/04/2024 05:40:36 PM
// Design Name: 
// Module Name: output_logic
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


module output_logic(
    input [2:0] states,
    output reg [5:0] leds
    );
    always @(*) begin
        case (states)
          3'b000: leds = 6'b000_000;
          3'b001: leds = 6'b001_000;
          3'b010: leds = 6'b011_000;
          3'b011: leds = 6'b111_000;
          3'b100: leds = 6'b000_100;
          3'b101: leds = 6'b000_110;
          3'b110: leds = 6'b000_111;
          default: leds = 6'b111_111;        //为什么只有000全为000， 111有1这种情况不正常
        endcase
    end
endmodule
