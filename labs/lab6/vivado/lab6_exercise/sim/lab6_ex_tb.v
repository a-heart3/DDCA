`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/15/2024 09:01:26 AM
// Design Name: 
// Module Name: lab6_ex_tb
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


module lab6_ex_tb();
    // inputs
    reg left; 
    reg right;
    reg rst;
    reg [2:0] states_p;

    // outputs
    wire [5:0] leds;
    wire [2:0] states_n;

    // test clock
    reg clk;

    // Expected outputs
    reg [5:0] leds_expected;
    reg [2:0] states_n_expected;

    // Vector and Error counts
    reg [10:0] vec_cnt, err_cnt;//record vector and error info

    // testvec that is wide enough to hold the inputs
    reg [14:0] testvec [0:23];

    // The test clock generation
    always begin
        clk = 1; #50;       //clk is 1 for 50 ns
        clk = 0; #50;       //clk is 0 for 50 ns
    end                     //generate a 100 ns clock

    initial begin
        $readmemb("../../../../testfsm.txt", testvec);

        err_cnt = 0; // number of errors
        vec_cnt = 0; // number of vectors
    end              

    //Tests
    always @ (posedge clk)          //trigger with the test clock
    begin
        // wait 20 ns, so that we can safely apply the inputs
        #20;

        // Assign the signals from the testvec array
        {states_p, left, right, rst, states_n_expected, leds_expected} = testvec[vec_cnt];

        // Wait another 60ns after which we will be at 80ns
        #60;

        // Check if output is not what we expect to see
        if ((states_n !== states_n_expected) | (leds !== leds_expected))
        begin
            // Display message
            $display("Error at %5d ns: states_p: %b, left: %b, right: %b, rst: %b", $time, states_p, left, right, rst);
            $display("                 states_n: %b (%b expected)", states_n, states_n_expected);
            $display("                 leds    : %b (%b expected)", leds, leds_expected);
            err_cnt = err_cnt + 1;
        end

        vec_cnt = vec_cnt + 1;

        // We use === so that we can also test for x
        if((testvec[vec_cnt][14:12] === 3'bxxx))
        begin
            // End of test, no more entries...
            $display ("%d tests completed with %d errors", vec_cnt, err_cnt);

            // Wait so that we can see the last result
            #20;

            //Terminate the simulation
            $finish;
        end

    end
    top tp (.left(left), .right(right), .rst(rst), .state_p(states_p), .state_n(states_n), .leds(leds));

endmodule
