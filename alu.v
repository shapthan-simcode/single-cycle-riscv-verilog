module alu(
    input [31:0] a,
    input [31:0] b,
    input [1:0] alu_ctrl,
    output reg [31:0] y
);

always @(*) begin
    case(alu_ctrl)
        2'b00: y = a + b;
        2'b01: y = a - b;
        2'b10: y = a & b;
        2'b11: y = a | b;
    endcase
end

endmodule