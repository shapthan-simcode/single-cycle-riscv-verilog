module pc(
    input clk,
    input reset_n,
    output reg [31:0] pc
);

always @(posedge clk or negedge reset_n)
begin
    if(!reset_n)
        pc <= 0;
    else
        pc <= pc + 4;
end

endmodule