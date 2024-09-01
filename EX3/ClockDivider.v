module ClockDivider (
    input wire clk, reset,
    input wire [1:0] in,
    output wire out
);

reg [23:0] counter;
reg div_clk_reg;

initial begin
    counter <= 0;  // Use non-blocking assignment
    div_clk_reg <= 1'b1;  // Use non-blocking assignment
end

always @(posedge clk or posedge reset) begin
    if (reset) begin // asynchronous
        counter <= 0;
    end 
    else begin
        if (counter == 0) begin
            case (in)
                2'b00: counter <= 249_999;  // 100 Hz
                2'b01: counter <= 24_999;   // 1 kHz
                2'b10: counter <= 2_499;    // 10 kHz
                2'b11: counter <= 249;      // 100 kHz
                default: counter <= 0;
            endcase
            div_clk_reg <= ~div_clk_reg;
        end else if (counter > 0) begin   // synchronous and counter > 0
            counter <= counter - 1'b1;    // Decrement counter
        end
    end
end

assign out = div_clk_reg;

endmodule
