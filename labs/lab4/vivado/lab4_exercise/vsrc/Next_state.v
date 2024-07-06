`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/06/2024 10:57:25 PM
// Design Name: 
// Module Name: Next_state
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


module Next_state(
    input left, right, rst,
    input [3:0] present_state,
    output [3:0] next_state
    );
    typedef enum [1:0] {S0, S1, S2} statetype;
    statetype [1:0] state, next_state;
    always @(*) begin
        
    end
endmodule
