`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/04/2024 05:53:00 PM
// Design Name: 
// Module Name: output_logic_tb
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


module output_logic_tb();
reg [2:0] states;
wire [5:0] leds;
initial begin
    states = 3'b000;
end
always begin
    #5
    states = states + 1;
end

output_logic ol (.states(states), .leds(leds));
endmodule
