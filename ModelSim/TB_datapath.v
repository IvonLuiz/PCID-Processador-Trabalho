`timescale 1ns / 10ps

module TB_datapath;

reg reset, wren, controle_pilha, clk_pilha, clk_temp2, load_temp2, load_temp1, clk_temp1;
reg [15:0] din_UC;
reg [4:0] opcode;
wire [15:0] dout, tos;

// Instanciar o módulo datapath
datapath uut (
    .reset(reset),
    .wren(wren),
    .controle_pilha(controle_pilha),
    .clk_pilha(clk_pilha),
    .clk_temp2(clk_temp2),
    .load_temp2(load_temp2),
    .load_temp1(load_temp1),
    .clk_temp1(clk_temp1),
    .din_UC(din_UC),
    .opcode(opcode),
    .dout(dout),
    .tos(tos)
);


// Inicializar entradas
initial begin
    clk_pilha = 0;
    clk_temp1 = 0;
    clk_temp2 = 0;
    reset = 1;
    wren = 0;
    controle_pilha = 0;
    din_UC = 16'h1234;
    opcode = 5'b00000;
    load_temp1 = 0;
    load_temp2 = 0;

    // Esperar alguns ciclos
    #5;

    clk_pilha = 1;
    clk_temp1 = 1;
    clk_temp2 = 1;
    #5;

    // Desativar o reset
    reset = 0;
    clk_pilha = 0;
    clk_temp1 = 0;
    clk_temp2 = 0;

    
    // Teste 1: Carregar dado na pilha
    wren = 1;
    #5;
    clk_pilha = 1;
    #5
    clk_pilha = 0;
    #5

    load_temp1 = 1;
    load_temp2 = 1;
    #5
    wren = 0;
    #5;
    clk_pilha = 1;
    #5;
    clk_temp2 = 1;
    clk_temp1 = 1;
    
    #5
    load_temp1 = 0;
    load_temp2 = 0;
    clk_pilha = 0;
    clk_temp2 = 0;
    clk_temp1 = 0;
    

    // Exibir resultados após Teste 1
    $display("Resultado após escrita na pilha e carregar valores nos temps:");
    $display("dout = %h", dout);
    $display("Valor armazenado no temp1: %h", uut.SYNTHESIZED_WIRE_3);
    $display("Valor armazenado no temp1: %h", uut.SYNTHESIZED_WIRE_4);
    $display("Resultado da ULA: %h", uut.SYNTHESIZED_WIRE_0);

    din_UC = 16'h0001;
    // Teste 2: Executar operação ULA (Soma)
    opcode = 5'b00100; // Soma
    
    
    #5;
    controle_pilha = 1;
    wren = 1;
    #5;
    clk_pilha = 1;
    #5;
    clk_pilha = 0;
    #5
    wren = 0;
    #5;
    clk_pilha = 1;
    #5;
    clk_pilha = 0;
    // Exibir resultados após operação na ULA
    $display("Resultado apos operacao na ULA e pop na pilha com valor da ULA:");
    $display("dout = %h", dout);
    $display("Resultado da ULA: %h", uut.SYNTHESIZED_WIRE_0);
    $stop; // Parar a simulação
end

endmodule
