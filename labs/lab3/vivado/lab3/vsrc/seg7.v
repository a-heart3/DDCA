`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/01/2024 11:18:45 AM
// Design Name: 
// Module Name: seg7
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


module seg7(
    input [3:0] in,
    output reg [6:0] out
    );
    always @(*) begin
       case (in)
        4'b0000: out <= 7'b000_0001;
        4'b0001: out <= 7'b100_1111;
        4'b0010: out <= 7'b001_0010;
        4'b0011: out <= 7'b000_0110;
        4'b0100: out <= 7'b100_1100;
        4'b0101: out <= 7'b010_0100;
        4'b0110: out <= 7'b010_0000;
        4'b0111: out <= 7'b000_1111;
        4'b1000: out <= 7'b000_0000;
        4'b1001: out <= 7'b000_0100;
        4'b1010: out <= 7'b000_1000;
        4'b1011: out <= 7'b110_0000;
        4'b1100: out <= 7'b011_0001;
        4'b1101: out <= 7'b100_0010;
        4'b1110: out <= 7'b011_0000;
        4'b1111: out <= 7'b011_1000;
       endcase
    end
        
            
endmodule

/*
这里的引脚最高位对应的为7位晶体管的a
一定要指定输入输出的位数，否则可能会产生随机数
*/