module decoder(
    input [31:0] instr,
    output [6:0] opcode,
    output [4:0] rd,
    output [4:0] rs1,
    output [4:0] rs2
);

assign opcode = instr[6:0];
assign rd     = instr[11:7];
assign rs1    = instr[19:15];
assign rs2    = instr[24:20];

endmodule