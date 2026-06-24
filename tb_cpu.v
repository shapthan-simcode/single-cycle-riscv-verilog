module tb_cpu;

  reg clk;
  reg reset_n;

  wire [7:0] gpio_out;

  cpu_top uut (
            .clk(clk),
            .reset_n(reset_n),
            .gpio_out(gpio_out)
          );

  initial
  begin
    $dumpfile("processor.vcd");
    $dumpvars(0, tb_cpu);
  end

  initial
  begin
    clk = 0;
    forever
      #5 clk = ~clk;
  end

  initial
  begin
    reset_n = 0;
    #10;
    reset_n = 1;

    #200;
    $finish;
  end

endmodule
