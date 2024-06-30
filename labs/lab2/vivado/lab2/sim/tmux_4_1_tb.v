`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/30/2024 09:04:41 PM
// Design Name: 
// Module Name: tmux_4_1_tb
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


module tmux_4_1_tb();
    reg [3:0] a;
    reg [1:0] s;
    wire result;
    initial begin
        a = 4'b0;
        s = 2'b0;
    end
    always begin
        #5 a = a + 1;
        #5 s = s + 1;
    end

    tmux_4_1 ex (.a(a), .s(s), .result(result));
endmodule
