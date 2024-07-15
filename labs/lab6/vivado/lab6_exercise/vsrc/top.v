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
    input left, right, rst,
    input [2:0] state_p,
    output [2:0] state_n,
    output [5:0] leds
    );
    /* 
    because test bench is combinational logic test, do not need sequential logic  
    wire clk_en;
    always @(posedge clk, posedge rst) begin         //要边沿触发就都边沿触发，不支持混用（逻辑和时序的混用）
        if(rst) begin
            state_p <= 3'b000;
        end
        else if (clk_en) begin
            state_p <= state_n;
        end                        //寄存器一定要用非阻塞赋值，阻塞赋值，该条语句执行完才向下执行，无法将现有的状态向下一级.
    end 
    */
    Next_State ns (.left(left), .right(right), .reset(rst), .state_next(state_n), .state_p(state_p));
    output_logic ol (.states(state_n), .leds(leds));            //因为改变了图的样子，转为了纯逻辑电路，所以这里的连接也要改
endmodule
