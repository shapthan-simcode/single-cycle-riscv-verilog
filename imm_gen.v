module imm_gen(
    input [31:0] instr,
    output [31:0] imm
  );

  assign imm = {{20{instr[31]}}, instr[31:20]};

endmodule
