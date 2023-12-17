`timescale 1ns / 1ps

module TB_Pilha;

reg clk, rst, push, pop, controle_pilha;
reg [15:0] din_UC;
reg [31:0] din_ULA;
wire [15:0] dout, tos;

integer i;

// Instanciar pilha
Pilha uut(clk, rst, push, pop, controle_pilha, din_ULA, din_UC, dout, tos);

// Gerar clock
initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

// Inicializar entradas
initial begin
    rst = 1;
    push = 0;
    pop = 0;
    controle_pilha = 0;
    din_UC = 16'h0000;
    din_ULA = 32'h00000000;

    // Esperar alguns ciclos
    #10;

    // Desativar o reset
    rst = 0;

    // Teste 1: Escrever na pilha (Push)
    push = 1;
    controle_pilha = 0; // Selecionar escrita de din_UC
    din_UC = 16'd3;
    #10;


    // Teste 2: Escrever na pilha novamente (Push)
    push = 1;
    controle_pilha = 1; // Selecionar escrita de din_ULA
    din_ULA = 32'd2;
    #10;
    

    // Teste 3: Ler da pilha (Pop)
    push = 0;
    pop = 1;
    #10;

    $display("Dout apos primeiro pop: [%0d]", dout);

    // Teste 4: Ler da pilha novamente (Pop)
    push = 0;
    pop = 1;
    #10;

    $display("Dout apos segundo pop: [%0d]", dout);

    $stop;
end

endmodule
