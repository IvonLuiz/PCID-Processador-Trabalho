module Pilha (
    input                   clk,     // Sinal de clock
    input                   reset,   // Sinal de reset
    input      [WIDTH - 1:0] dado,    // Dado a ser empilhado
    output reg [WIDTH - 1:0] topo,    // Dado no topo da pilha
    input                   push,    // Sinal para realizar a operação de empilhamento
    input                   pop      // Sinal para realizar a operação de desempilhamento
);

    parameter LARGURA = 11; // Largura em bits do dado
    parameter PROFUNDIDADE = 7; // Profundidade da pilha

    reg [PROFUNDIDADE - 1:0] tos; // Ponteiro da pilha
    reg [LARGURA - 1:0] pilha [0:(1 << PROFUNDIDADE) - 1]; // Array representando a pilha

	 
	 
    always @(posedge clk) begin
        if (reset)
            tos <= 0;
        else if (push)
            tos <= tos + 1;
        else if (pop && tos > 0)
            tos <= tos - 1;
    end

    always @(posedge clk) begin
        if (push || pop) begin
            if(push)
                pilha[tos] <= topo;

            if (tos > 0)
                topo <= pilha[tos - 1];
        end
    end

endmodule
