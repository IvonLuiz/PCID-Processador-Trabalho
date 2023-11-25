module IR ( clk, loadIR, memIn, endereco, opcode);

input clk;
input loadIR;
input [15:0] memIn;
output [11:0] endereco;
output [3:0] opcode;

reg [11:0] endereco;
reg [3:0] opcode;

reg [15:0] temp;

always@(posedge clk)
begin
    if(loadIR == 1) begin
    temp <= memIn;
    end
endereco <= temp[11:0];
opcode <= temp[15:12];
end
endmodule