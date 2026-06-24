module instruction_memory(
    input [31:0] addr,
    output [31:0] instr
  );

  reg [31:0] mem [0:255];

  initial
  begin
    $readmemh("firmware.hex", mem);
  end

  assign instr = mem[addr[5:2]];

endmodule
