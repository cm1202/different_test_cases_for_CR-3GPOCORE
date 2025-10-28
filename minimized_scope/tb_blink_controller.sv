`timescale 1ns / 1ps

module tb_blink_controller;

    // ----- 1. Declare Testbench Signals -----
    logic led,clk,rst;
    logic [15:0] speed;

    // ----- 2. Instantiate the Device Under Test (DUT) -----
    blink_controller blink(
        .clk(clk),
        .rst(rst),
        .speed(speed),
        .led(led)
    );
    
    // ----- Clock Generation -----
    // FIX 1: Change clock back to 10ns period (100 MHz)
    initial begin
        clk = 0;
        forever #5 clk = ~clk; 
    end

    // ----- Test Sequence -----
    initial begin
        $display("T=%0t: Simulation Started.", $time);
        
        rst = 1;         // Start in reset
        speed = 16'd5;   // Set speed to 5ms
        
        // Hold reset for 2 clock cycles
        repeat(2) @(posedge clk);
        rst = 0;         // Come out of reset

        #12_000_000; 
        
        $finish;         // Stop the simulation
    end
    
    // Optional but highly recommended: Monitor the signals
    initial begin

    end

endmodule