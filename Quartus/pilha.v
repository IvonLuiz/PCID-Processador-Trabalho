module Pilha (clk, rst, push, pop, controle_pilha, din_ULA, din_UC, dout);

// Largura da pilha = 16 e profundidade = 16

input clk;
input rst;
input push;
input pop;
input controle_pilha;
input [15:0] din_UC;
input [31:0] din_ULA;

output [15:0] dout;

reg [15:0] pilha[15:0]; // memória
reg [15:0] indice;	// topo da pilha
reg [15:0] dout, prox_dout;

// always @(posedge clk or posedge rst) // Bloco Sequencial
// begin
//     if (rst)
//     begin
//         dout  <= 8'd0;
//         prox_dout <= 8'd0;
//         indice <= 1'b0;
//         prox_indice <= 1'b1;
//     end
//     else
//     begin
//         dout  <= prox_dout;
//         indice <= prox_indice;
//     end
// end


always @(posedge clk or posedge rst)
begin
    if (rst)
        indice <= 1'b0;
    else if (push)
        indice <= indice + 1'b1;
    else if (pop)
        indice <= indice - 1'b1;
end

always @(posedge clk) 
begin
    if (push || pop) begin
        if(push)
            if (controle_pilha == 0)
                begin
                    pilha[indice] <= din_UC;
                end
            else
                begin
                    pilha[indice] <= din_ULA;
                end
            
        if (pop == 1)  // ler
        begin
            dout <= pilha[indice - 1'b1];
        end
    end
end

// always @(*) // Bloco Combinacional
// begin
//     if (push == 1) // escrever
//     begin
// 		if (controle_pilha == 0)
// 			begin
// 				pilha[indice] = din_UC;
// 				prox_indice   = indice + 1'b1;
// 			end
// 		else
// 			begin
// 				pilha[indice] = din_ULA;
// 				prox_indice   = indice + 1'b1;
// 			end
//     end
//     else if (pop == 1)  // ler
//     begin
//         if (indice == 0)
//             begin
//                 prox_dout = pilha[indice];
//                 prox_indice = indice;
//             end
//         else
//             begin
//                 prox_dout = pilha[indice - 1'b1];
//                 prox_indice = indice - 1'b1;
//             end
//     end
// end

endmodule
