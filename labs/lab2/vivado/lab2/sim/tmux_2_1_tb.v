`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/30/2024 11:59:34 AM
// Design Name: 
// Module Name: tmux_2_1_tb
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


module tmux_2_1_tb();
reg a, b, s;
wire result;
initial begin
    a = 1'b0;
    b = 1'b0;
    s = 1'b0;
end
always begin
    #20 s = ~s;
    #5 b = ~b;
    #10 a = ~a; 
end

multiplexer_2_1 mux_2_1(.a(a), .b(b), .s(s), .result(result));
endmodule

/*
这个test文件写的不好，
延时都是从0时刻开始算的