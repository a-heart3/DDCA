`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/30/2024 09:48:36 AM
// Design Name: 
// Module Name: Decoder
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


module Decoder(
    input a, b,
    output o, o1, o2, o3
    );
    wire na, nb;
    not g1 (na, a);
    not g2 (nb, b);                     //获得a，b的非
    and g3 (o, na, nb);
    and g4 (o1, a, nb);
    and g5 (o2, na, b);
    and g6 (o3, a, b);
endmodule
