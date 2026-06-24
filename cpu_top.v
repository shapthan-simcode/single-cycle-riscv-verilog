module cpu_top(
    input clk,
    input reset_n
  );

  wire [31:0] pc;
  wire [31:0] instr;
  wire [31:0] imm;

  wire [6:0] opcode;
  wire [4:0] rd;
  wire [4:0] rs1;
  wire [4:0] rs2;

  wire [31:0] data1;
  wire [31:0] data2;

  wire reg_write;
  wire alu_src;

  wire [31:0] alu_b;
  wire [31:0] result;

  pc PC(
       .clk(clk),
       .reset_n(reset_n),
       .pc(pc)
     );

  instruction_memory IMEM(
                       .addr(pc),
                       .instr(instr)
                     );

  decoder DEC(
            .instr(instr),
            .opcode(opcode),
            .rd(rd),
            .rs1(rs1),
            .rs2(rs2)
          );

  imm_gen IMM(
            .instr(instr),
            .imm(imm)
          );

  control CTRL(
            .opcode(opcode),
            .reg_write(reg_write),
            .alu_src(alu_src)
          );

  regfile RF(
            .clk(clk),
            .we(reg_write),
            .rs1(rs1),
            .rs2(rs2),
            .rd(rd),
            .wd(result),
            .rd1(data1),
            .rd2(data2)
          );

  assign alu_b = alu_src ? imm : data2;

  alu ALU(
        .a(data1),
        .b(alu_b),
        .alu_ctrl(2'b00),
        .y(result)
      );

endmodule
