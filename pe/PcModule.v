// Program Counter (PC) Module
module PcModule(
    input clk,
    input rst,
    input [31:0] next_pc,
    output reg [31:0] pc
);
    always @(posedge clk or posedge rst) begin
        if (rst)
            pc <= 32'b0; // Reset PC to 0
        else
           // pc <= next_pc; This part is wrong it should be increasing 4 like this: 0  4 8 12..
				pc <= next_pc + 4;
    end
endmodule