module tb_cpu;

  reg clk;
  reg reset_n;

  cpu_top uut (
            .clk(clk),
            .reset_n(reset_n)
          );

  initial
  begin
    clk = 0;
    forever
      #5 clk = ~clk;
  end

  initial
  begin
    $monitor("Time=%0t", $time);

    reset_n = 0;
    #10;
    reset_n = 1;

    #100;
    $finish;
  end

endmodule
