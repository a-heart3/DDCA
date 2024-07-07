`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/07/2024 10:26:12 AM
// Design Name: 
// Module Name: out_logic
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


module out_logic(
    input [3:0] present_state,
    output reg [1:0] LDC, LDB, LDA, RDA, RDB, RDC                 //每一个灯对应三种状态, 11:100%, 10:75%, 01:50%亮度, 00：不亮 LD3-RD3对应从左到右的灯
    );
    typedef enum logic [3:0] {S0, L1, L2, L3, L4, L5, R1, R2, R3, R4, R5, S1} states;       //这里应该与Next_state的定义保持一致

    always @(*) begin
        case (present_state)
            S0: begin
                LDC <= 2'b00;
                LDB <= 2'b00;
                LDA <= 2'b00;
                RDA <= 2'b00;
                RDB <= 2'b00;
                RDC <= 2'b00;
            end
            S1: begin
                LDC <= 2'b11;
                LDB <= 2'b11;
                LDA <= 2'b11;
                RDA <= 2'b11;
                RDB <= 2'b11;
                RDC <= 2'b11;
            end
            L1: begin
                LDC <= 2'b00;
                LDB <= 2'b00;
                LDA <= 2'b01;
                RDA <= 2'b00;
                RDB <= 2'b00;
                RDC <= 2'b00;
            end
            L2: begin
                LDC <= 2'b00;
                LDB <= 2'b01;
                LDA <= 2'b10;
                RDA <= 2'b00;
                RDB <= 2'b00;
                RDC <= 2'b00;
            end
            L3: begin
                LDC <= 2'b01;
                LDB <= 2'b10;
                LDA <= 2'b11;
                RDA <= 2'b00;
                RDB <= 2'b00;
                RDC <= 2'b00;
            end
            L4: begin
                LDC <= 2'b10;
                LDB <= 2'b11;
                LDA <= 2'b11;
                RDA <= 2'b00;
                RDB <= 2'b00;
                RDC <= 2'b00;
            end
            L5: begin
                LDC <= 2'b11;
                LDB <= 2'b11;
                LDA <= 2'b11;
                RDA <= 2'b00;
                RDB <= 2'b00;
                RDC <= 2'b00;
            end
            R1: begin
                LDC <= 2'b00;
                LDB <= 2'b00;
                LDA <= 2'b00;
                RDA <= 2'b01;
                RDB <= 2'b00;
                RDC <= 2'b00;
            end
            R2: begin
                LDC <= 2'b00;
                LDB <= 2'b00;
                LDA <= 2'b00;
                RDA <= 2'b10;
                RDB <= 2'b01;
                RDC <= 2'b00;
            end
            R3: begin
                LDC <= 2'b00;
                LDB <= 2'b00;
                LDA <= 2'b00;
                RDA <= 2'b11;
                RDB <= 2'b10;
                RDC <= 2'b01;
            end
            R4: begin
                LDC <= 2'b00;
                LDB <= 2'b00;
                LDA <= 2'b00;
                RDA <= 2'b11;
                RDB <= 2'b11;
                RDC <= 2'b10;
            end
            R5: begin
                LDC <= 2'b00;
                LDB <= 2'b00;
                LDA <= 2'b00;
                RDA <= 2'b11;
                RDB <= 2'b11;
                RDC <= 2'b11;
            end
            default: begin
                LDC <= 2'b00;
                LDB <= 2'b00;
                LDA <= 2'b00;
                RDA <= 2'b00;
                RDB <= 2'b00;
                RDC <= 2'b00;
            end
 
        endcase
    end
endmodule
