`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/04/2024 04:19:18 PM
// Design Name: 
// Module Name: Next_State
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


module Next_State(
    input [2:0] state_p,            //present states
    output reg [2:0] state_next,        //next states
    input left, right, reset        //signals
    );
    wire [5:0] states_signals;      //state and signals
    assign states_signals = {state_p[2:0], left, right, reset};
    always @(*) begin
        casez (states_signals)                              //casex用来处理不定值x的情况，如果不加，则含有不定值x的情况会执行default
          6'b000_100: state_next = 3'b001;                  //这里不明白为什么会有'case item is unreachable',多写了一种情况
          6'b000_010: state_next = 3'b100;
          6'b000_000: state_next = 3'b000;
          6'b000_110: state_next = 3'b111;
          6'b000_??1: state_next = 3'b000;
          6'b001_?00: state_next = 3'b010;
          6'b001_?10: state_next = 3'b111;
          6'b001_??1: state_next = 3'b000;
          6'b010_?00: state_next = 3'b011;
          6'b010_?10: state_next = 3'b111;
          6'b010_??1: state_next = 3'b000;
          6'b011_?00: state_next = 3'b000;
          6'b011_?10: state_next = 3'b111;
          6'b011_??1: state_next = 3'b000;
          6'b100_0?0: state_next = 3'b101;
          6'b100_1?0: state_next = 3'b111;
          6'b100_??1: state_next = 3'b000;
          6'b101_0?0: state_next = 3'b110;
          6'b101_1?0: state_next = 3'b111;
          6'b101_??1: state_next = 3'b000;
          6'b110_0?0: state_next = 3'b000;
          6'b110_1?0: state_next = 3'b111;
          6'b110_??1: state_next = 3'b000;
          6'b111_???: state_next = 3'b000;
          default:    state_next = 3'b111;              //这里增加了case的default情况，不属于上述任意一个情况则报错处理
        endcase
    end
endmodule
