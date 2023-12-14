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

task automatic carregar_dado;
    input [15:0] dado;
    input load_in_temp1;
    input load_in_temp2;

    begin
        din_UC = dado;
        wren = 1;
        #5;
        clk_pilha = 1;
        #5;
        clk_pilha = 0;
        #5;

        if (load_in_temp1)
            load_temp1 = 1;
        else if (load_in_temp2)
            load_temp2 = 1;

        #5;
        wren = 0;
        #5;
        clk_pilha = 1;
        #5;
        clk_temp2 = 1;
        clk_temp1 = 1;

        #5;
        load_temp1 = 0;
        load_temp2 = 0;
        clk_pilha = 0;
        clk_temp2 = 0;
        clk_temp1 = 0;

        $display("Resultado após escrita na pilha e carregar valores nos temps:");
        $display("dout = %h", dout);
        $display("Valor armazenado no temp1: %h", uut.SYNTHESIZED_WIRE_3);
        $display("Valor armazenado no temp2: %h", uut.SYNTHESIZED_WIRE_4);
        $display("Resultado da ULA: %h", uut.b2v_inst_ula.resultado);
    end
endtask



task run_ula_test(input [4:0] op);
begin
    opcode = op;

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
    $display("Operando 1: %b", uut.b2v_inst_ula.operando1);
    $display("Operando 2: %b", uut.b2v_inst_ula.operando2);
    
    $display("dout = %h", dout);
    $display("Resultado da ULA hexadecimal: %h", uut.b2v_inst_ula.resultado);
    $display("Resultado da ULA binario: %b", uut.b2v_inst_ula.resultado);
    $display("Resultado da ULA decimal: %d \n", uut.b2v_inst_ula.resultado);
end
endtask

task comparador_teste(input [4:0] op);
begin
    opcode = op;

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
    $display("Operando 1: %b", uut.b2v_inst_ula.operando1);
    $display("Data_uc da ULA binario: %b \n", uut.b2v_inst_ula.data_uc);
end
endtask


// Inicializar entradas
initial begin
    clk_pilha = 0;
    clk_temp1 = 0;
    clk_temp2 = 0;
    reset = 1;
    wren = 0;
    controle_pilha = 0;
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
    carregar_dado(16'd4, 1, 0);
    carregar_dado(16'd2, 0, 1);


    // Teste 2: Executar operação ULA (Soma)
    $display("Resultado apos soma na ULA e pop na pilha com valor da ULA:");
    run_ula_test(uut.b2v_inst_ula.Add); // Soma


    // Teste 3: Executar operação ULA (Subtração)
    $display("Resultado apos subtracao na ULA e pop na pilha com valor da ULA:");
    run_ula_test(uut.b2v_inst_ula.Sub); 

    $display("Resultado apos multiplicacao na ULA e pop na pilha com valor da ULA:");
    run_ula_test(uut.b2v_inst_ula.Mul); 

    $display("Resultado apos divisao na ULA e pop na pilha com valor da ULA:");
    run_ula_test(uut.b2v_inst_ula.Div); 

    $display("Resultado apos AND na ULA e pop na pilha com valor da ULA:");
    run_ula_test(uut.b2v_inst_ula.And); 

    $display("Resultado apos NAND na ULA e pop na pilha com valor da ULA:");
    run_ula_test(uut.b2v_inst_ula.Nand); 

    $display("Resultado apos OR na ULA e pop na pilha com valor da ULA:");
    run_ula_test(uut.b2v_inst_ula.Or); 

    $display("Resultado apos XOR na ULA e pop na pilha com valor da ULA:");
    run_ula_test(uut.b2v_inst_ula.Xor); 

    $display("Resultado apos CMP na ULA e pop na pilha com valor da ULA:");
    run_ula_test(uut.b2v_inst_ula.Cmp); 
    
    $display("Resultado apos NOT na ULA e pop na pilha com valor da ULA:");
    run_ula_test(uut.b2v_inst_ula.Not); 

    $display("Resultado apos IF_EQ na ULA e pop na pilha com valor da ULA:");
    comparador_teste(uut.b2v_inst_ula.If_eq); 

    $display("Resultado apos IF_GT na ULA e pop na pilha com valor da ULA:");
    comparador_teste(uut.b2v_inst_ula.If_gt); 

    $display("Resultado apos IF_LT na ULA e pop na pilha com valor da ULA:");
    comparador_teste(uut.b2v_inst_ula.If_lt); 

    $display("Resultado apos IF_GE na ULA e pop na pilha com valor da ULA:");
    comparador_teste(uut.b2v_inst_ula.If_ge); 

    $display("Resultado apos IF_LE na ULA e pop na pilha com valor da ULA:");
    comparador_teste(uut.b2v_inst_ula.If_le); 

end

endmodule
