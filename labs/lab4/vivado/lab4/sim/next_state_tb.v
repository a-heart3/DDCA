`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/04/2024 04:47:50 PM
// Design Name: 
// Module Name: next_state_tb
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


module next_state_tb();
reg  [2:0] states_p;
reg  [2:0] signals;      //方便模拟
wire [2:0] states_n;
wire left, right, reset;      //方便模拟
reg [2:0] count;
assign left = signals[2];
assign right = signals[1];
assign reset = signals[0];

initial begin
    states_p = 3'b000;
    signals = 3'b000;
    count = 3'b000;
end

always begin
    # 5;
    if (count != 3'b111) begin
        count <= count + 1;
        signals <= signals + 1;
    end
    else begin
        count <= 3'b000;
        states_p <= states_p + 1;
    signals <= 3'b000;
    end
end

Next_State ns (.state_p(states_p), .state_next(states_n), .left(signals[2]), .right(signals[1]), .reset(signals[0]));   //输出不能是reg类型
endmodule
