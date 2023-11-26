module Pilha (clk, rst, pop, push, din, dout, tos);

// Largura da pilha = 16 e profundidade = 16

input clk;
input rst;
input pop;
input push;
input [15:0] din;

output [15:0] dout;
output [15:0] tos;

reg [15:0] pilha[15:0]; // memória
reg [15:0] indice, prox_indice;
reg [15:0] dout, prox_dout;

assign tos = indice;

always @(posedge clk) // Bloco Sequencial
begin
    if (rst)
    begin
        dout  <= 8'd0;
        indice <= 1'b0;
    end
    else
    begin
        dout  <= prox_dout;
        indice <= prox_indice;
    end
end


always @(*) // Bloco Combinacional
begin
    if (push) // escrever
    begin
        pilha[indice] = din;
        prox_indice   = indice + 1'b1;
    end
    else if (pop)  // ler
    begin
        prox_dout  = pilha[indice - 1'b1];
        prox_indice = indice - 1'b1;
    end
    else
    begin
        prox_dout  = dout;
        prox_indice = indice;
    end
end

endmodule
