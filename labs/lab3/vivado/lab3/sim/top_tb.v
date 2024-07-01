`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/01/2024 12:02:48 PM
// Design Name: 
// Module Name: top_tb
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


module top_tb();
reg [3:0] a;
reg [3:0] b;
wire overflow;
wire [6:0] D;
wire [3:0] AN;
reg [1:0] sel;
initial begin
    a = 4'b0000;
    b = 4'b0000;
    sel = 2'b00;
end
always begin
    #10 
    a = a + 1;
    b = b + 1;
    sel = sel + 1;
end

top tp (.a(a), .b(b), .overflow(overflow), .D(D), .AN(AN), .sel(sel));
endmodule
