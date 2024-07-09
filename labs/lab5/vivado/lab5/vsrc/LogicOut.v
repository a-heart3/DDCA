`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/09/2024 12:41:20 PM
// Design Name: 
// Module Name: LogicOut
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


module LogicOut(
    input [31:0] A, B,
    input [3:0] aluop,
    output reg [31:0] result
    );

    wire [1:0] sel;
    assign sel = aluop[1:0];
    always @(*) begin
        case (sel)
            2'b00: result = A & B;
            2'b01: result = A | B;
            2'b10: result = A ^ B;
            2'b11: result = ~(A|B);
        endcase
    end
endmodule


//这里会产生"first unread bit index is 2" 的警告，可以无视， 也可以加上连线，连到空输出上（不做任何操作）
