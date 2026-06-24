module control(
    input [6:0] opcode,
    output reg reg_write,
    output reg alu_src
  );

  always @(*)
  begin
    reg_write = 0;
    alu_src   = 0;

    case(opcode)
      7'b0010011:
      begin // ADDI
        reg_write = 1;
        alu_src = 1;
      end

      7'b0110011:
      begin // ADD
        reg_write = 1;
        alu_src = 0;
      end
    endcase
  end

endmodule
