module ex3 (
    input wire clk,reset,
	 input wire [1:0] div,          // input
    output wire div_clk);     // Output divided clock


ClockDivider ClkDiv (.clk(clk),.reset(reset),.in(div[1:0]),.out(div_clk));

endmodule
