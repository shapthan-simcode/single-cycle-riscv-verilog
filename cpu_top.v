module cpu_top(
    input clk,
    input reset_n,
    output [7:0] gpio_out
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

  // Program Counter
  pc PC(
       .clk(clk),
       .reset_n(reset_n),
       .pc(pc)
     );

  // Instruction Memory
  instruction_memory IMEM(
                       .addr(pc),
                       .instr(instr)
                     );

  // Decoder
  decoder DEC(
            .instr(instr),
            .opcode(opcode),
            .rd(rd),
            .rs1(rs1),
            .rs2(rs2)
          );

  // Immediate Generator
  imm_gen IMM(
            .instr(instr),
            .imm(imm)
          );

  // Control Unit
  control CTRL(
            .opcode(opcode),
            .reg_write(reg_write),
            .alu_src(alu_src)
          );

  // Register File
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

  // ALU Input MUX
  assign alu_b = alu_src ? imm : data2;

  // ALU
  alu ALU(
        .a(data1),
        .b(alu_b),
        .alu_ctrl(2'b00),
        .y(result)
      );

  // GPIO Peripheral
  gpio GPIO(
         .clk(clk),
         .we(reg_write),
         .wdata(result),
         .gpio_out(gpio_out)
       );

endmodule
