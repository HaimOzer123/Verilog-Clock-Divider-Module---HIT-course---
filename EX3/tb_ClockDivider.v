`timescale 1ns/1ns

module tb_ClockDivider;

    reg clk;
    reg reset;
    reg [1:0] div;
    wire div_clk;

    ClockDivider CD (.clk(clk), .reset(reset), .in(div), .out(div_clk));

    // Continuous clock generation
    always #10 clk = ~clk; // clock every 10 ns

    initial begin
        clk = 0;
		  reset = 1; // Initial asynchronous reset
        #10_000 reset = 0; // Release reset after 10 ns
    end

    initial begin
		 #20_000 // Wait for a while before changing div values
		 
		  div = 2'b11; #40_000      // Set DIV to 11 (100 kHz)
		  div = 2'b10; #400_000  // Set DIV to 10 (10 kHz)
		  div = 2'b01; #2_000_000  // Set DIV to 01 (1 kHz)
        div = 2'b00; #10_000_000; // Set DIV to 00 (100 Hz)

		  //sum time to run in modlesim 12.47 mSEC
		  
    end
endmodule

