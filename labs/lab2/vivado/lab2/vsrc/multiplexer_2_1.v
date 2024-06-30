`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/30/2024 11:53:22 AM
// Design Name: 
// Module Name: multiplexer_2_1
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


module multiplexer_2_1(
    input a, b, s,
    output result
    );
    wire ns, m1, m2;
    not g1 (ns, s);
    and g2 (m1, a, ns);
    and g3 (m2, b, s);
    or g4 (result, m1, m2);
endmodule
