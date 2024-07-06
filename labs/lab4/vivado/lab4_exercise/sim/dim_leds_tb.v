`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/06/2024 09:41:18 PM
// Design Name: 
// Module Name: dim_leds_tb
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
///////g ///////////////////////////////////////////////////////////////////////////


module dim_leds_tb();

wire led;
reg clk, rst;
initial begin
    clk = 0;
    rst = 1;
    #10 rst = 0;
end

always begin
    #5 clk = ~clk;    
end

Dim_led Dl (.clk(clk), .rst(rst), .led(led));
endmodule
