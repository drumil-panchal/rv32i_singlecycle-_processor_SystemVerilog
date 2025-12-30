`timescale 1ns / 1ps

module tb;

    logic clk;
    logic reset_n;

    // Instantiate DUT
    top dut (
        .clk        (clk),
        .reset_n    (reset_n)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // Reset sequence
    initial begin
        reset_n = 0;
        #20;
        reset_n = 1;
    end

    // Simulation control
    initial begin
        #1000;
        $finish;
    end

endmodule
