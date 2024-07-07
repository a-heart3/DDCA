`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/07/2024 09:54:48 AM
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
    output reg [3:0] next_state
    );

    typedef enum logic [3:0] {S0, L1, L2, L3, L4, L5, R1, R2, R3, R4, R5, S1} states;
    always @(*) begin
        if (rst) begin
            next_state = S0;
        end
        else begin
            case (present_state)
                S0: begin
                    if (left & right) next_state = S1;
                    else if (left)    next_state = L1;
                    else if (right)   next_state = R1;
                    else              next_state = S0;
                end
                S1: begin
                    next_state = S0;
                end
                L1: begin
                    if (right)        next_state = S1;
                    else              next_state = L2;
                end 
                L2: begin
                    if (right)        next_state = S1;
                    else              next_state = L3;
                end 
                L3: begin
                    if (right)        next_state = S1;
                    else              next_state = L4;
                end 
                L4: begin
                    if (right)        next_state = S1;
                    else              next_state = L5;
                end 
                L5: begin
                    if (right)        next_state = S1;
                    else              next_state = S0;
                end 
                R1: begin
                    if (left)         next_state = S1;
                    else              next_state = R2;
                end 
                R2: begin
                    if (left)         next_state = S1;
                    else              next_state = R3;
                end 
                R3: begin
                    if (left)         next_state = S1;
                    else              next_state = R4;
                end 
                R4: begin
                    if (left)         next_state = S1;
                    else              next_state = R5;
                end 
                R5: begin
                    if (left)         next_state = S1;
                    else              next_state = S0;
                end
                default: begin
                    next_state = S0;
                end                                                                                                                     //这种方式相较于lab4的方式更具可读性，注意：if_else的逻辑顺序不可更换，因为判断顺序不同，会产生不同结果
            endcase
        end
    end
endmodule

/*逻辑
1. 先判断rst是否生效，无论何种状态，rstshengxiao直接重置为初始状态
2. S0判断输入，两个同时为1,S1， 任意一个为1, L1或R1, 全为0保持初始状态
   如果先判断left/right，则会出现 两个同时为1的情况无法判断，当left/right为真，if_else逻辑就退出了
*/