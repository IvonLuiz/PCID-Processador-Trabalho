module Pilha (clk, rst, wren, controle_pilha, din_ULA, din_UC, dout, tos);

// Largura da pilha = 16 e profundidade = 16

input clk;
input rst;
input wren;
input controle_pilha;
input [15:0] din_UC;
input [31:0] din_ULA;

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
    if (wren == 1) // escrever
    begin
		if (controle_pilha == 0)
			begin
				pilha[indice] = din_UC;
				prox_indice   = indice + 1'b1;
			end
		else
			begin
				pilha[indice] = din_ULA;
				prox_indice   = indice + 1'b1;
			end
    end
    else if (wren == 0)  // ler
    begin
        if (indice == 0)
            begin
                prox_dout = pilha[indice];
                prox_indice = indice;
            end
        else
            begin
                prox_dout = pilha[indice - 1'b1];
                prox_indice = indice - 1'b1;
            end
    end
    else
    begin
        prox_dout  = dout;
        prox_indice = indice;
    end
end

endmodule
