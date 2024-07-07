`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/07/2024 09:43:28 AM
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
    input clk, rst,
    input left, right,
    output LC, LB, LA, RA, RB, RC          //从左到右的灯
    //output reg [3:0] present_state,
    //output [3:0] next_state               //测试用
    );

    wire [3:0] next_state;
    reg [3:0] present_state;
    wire clk_en;
    wire [1:0] LDC, LDB, LDA, RDA, RDB, RDC;

    always @(posedge clk, posedge rst) begin
        if (rst) begin
            present_state <= 4'b0000;
        end
        else if (clk_en) begin
            present_state <= next_state;
        end
    end

    Next_state ns (.left(left), .right(right), .rst(rst), .present_state(present_state), .next_state(next_state));
    clk_div cd (.clk(clk), .rst(rst), .clk_en(clk_en));
    out_logic ol (.present_state(present_state), .LDC(LDC), .LDB(LDB), .LDA(LDA), .RDA(RDA), .RDB(RDB), .RDC(RDC));
    led_dim lc (.sel(LDC), .clk(clk), .rst(rst), .led(LC));
    led_dim lb (.sel(LDB), .clk(clk), .rst(rst), .led(LB));
    led_dim la (.sel(LDA), .clk(clk), .rst(rst), .led(LA));
    led_dim ra (.sel(RDA), .clk(clk), .rst(rst), .led(RA));
    led_dim rb (.sel(RDB), .clk(clk), .rst(rst), .led(RB));
    led_dim rc (.sel(RDC), .clk(clk), .rst(rst), .led(RC));

endmodule
