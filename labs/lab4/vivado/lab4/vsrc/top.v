`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/04/2024 09:04:23 PM
// Design Name: 
// Module Name: top
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


module top(
    input left, right, rst, clk,
    output [5:0] leds
    );
    wire [2:0] state_n;
    reg [2:0] state_p;
    wire clk_en;
    always @(posedge clk, posedge rst) begin         //要边沿触发就都边沿触发，不支持混用（逻辑和时序的混用）
        if(rst) begin
            state_p <= 3'b000;
        end
        else if (clk_en) begin
            state_p <= state_n;
        end                        //寄存器一定要用非阻塞赋值，阻塞赋值，该条语句执行完才向下执行，无法将现有的状态向下一级.
    end 
    Next_State ns (.left(left), .right(right), .reset(rst), .state_next(state_n), .state_p(state_p));
    clk_div cd (.clk(clk), .rst(rst), .clk_en(clk_en));
    output_logic ol (.states(state_p), .leds(leds));
endmodule
