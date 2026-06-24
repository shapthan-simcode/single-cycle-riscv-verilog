module gpio(
    input clk,
    input we,
    input [31:0] wdata,
    output reg [7:0] gpio_out
  );

  initial
  begin
    gpio_out = 8'b0;
  end

  always @(posedge clk)
  begin
    if(we)
      gpio_out <= wdata[7:0];
  end

endmodule
