`timescale 1ns / 1ps

module TB_temp;

reg clk, loadTemp, reset;
reg [15:0] entrada;
wire [15:0] saida;

// Instanciar o módulo temp
temp uut(
    .clk(clk),
    .loadTemp(loadTemp),
    .reset(reset),
    .entrada(entrada),
    .saida(saida)
);

// Gerar clock
initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

// Inicializar entradas
initial begin
    reset = 1;
    loadTemp = 0;
    entrada = 16'h1234;

    // Esperar alguns ciclos
    #10;

    // Desativar o reset
    reset = 0;

    // Teste 1: Carregar dado
    loadTemp = 1;
    entrada = 16'h5678;
    #10;
    loadTemp = 0;

    // Exibir resultados após Teste 1
    $display("Resultado apos loadTemp=1:");
    $display("saida = %h", saida);

    // Teste 2: Não carregar dado
    loadTemp = 0;
    entrada = 16'd0001;
    #10;

    // Exibir resultados após Teste 2
    $display("Resultado apos loadTemp=0:");
    $display("saida = %h", saida);

    $stop; // Parar a simulação
end

endmodule
