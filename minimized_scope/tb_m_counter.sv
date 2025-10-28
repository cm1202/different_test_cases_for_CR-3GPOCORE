`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Module: m_counter_tb
// Description: Testbench for the m_counter module.
//////////////////////////////////////////////////////////////////////////////////

module tb_m_counter;

    // ----- Parameters -----
    // Define a 100MHz clock (10ns period)
    parameter CLK_PERIOD = 100;
    
    // Get the MAXCOUNT from the DUT to make the testbench robust
    localparam DUT_MAXCOUNT = m_counter.MAXCOUNT; // 99_999

    // ----- Testbench Signals -----
    logic tb_clk;
    logic tb_rst;
    logic tb_tic;

    // ----- Instantiate the Device Under Test (DUT) -----
    m_counter dut (
        .clk(tb_clk),
        .rst(tb_rst),
        .tic(tb_tic)
    );

    // ----- Clock Generation -----
    // Create a free-running clock with a 50% duty cycle
    initial begin
        tb_clk = 0;
        forever #CLK_PERIOD tb_clk = ~tb_clk;

    end

    // ----- Test Sequence -----
    initial begin
        tb_rst = 1; 
        #(10000); 
        tb_rst= 0; 
        #(10000); 
    end

endmodule