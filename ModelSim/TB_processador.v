`timescale 1ns / 1ps

module TB_Processador;

reg clock;
reg reset;

processador uut (
    .clock(clock),
    .reset(reset)
);

// Gerar clock
initial begin
    clock = 0;
    forever #5 clock = ~clock;
end

initial begin
    $monitor($time, "Estado_atual='%0d", uut.b2v_inst_UC.estado_atual);
end

always @(posedge clock) begin
    $display("Addres ROM: [%0d]", uut.b2v_inst_UC.a_rom);
end

always @(posedge clock) begin
    $display("Data mem: [%b]", uut.b2v_inst_UC.data_mem);
end

always @(posedge clock) begin
    $display("Saida da Pilha: [%0d]", uut.b2v_inst_datapath.dout);
end

always @(posedge clock) begin
    $display("Entrada da Pilha (din_UC): [%b]", uut.b2v_inst_datapath.b2v_inst_pilha.din_UC);
end

always @(posedge clock) begin
    $display("Entrada da Pilha (din_ULA): [%b]", uut.b2v_inst_datapath.b2v_inst_pilha.din_ULA);
end

always @(posedge clock) begin
    $display("Saida da Pilha: [%b]", uut.b2v_inst_datapath.b2v_inst_pilha.dout);
end

always @(posedge clock) begin
    $display("Entrada Temp1: [%0d]", uut.b2v_inst_datapath.b2v_inst_temp1.entrada);
end

always @(posedge clock) begin
    $display("Saida Temp1: [%0d]", uut.b2v_inst_datapath.b2v_inst_temp1.saida);
end

always @(posedge clock) begin
    $display("Entrada Temp2: [%0d]", uut.b2v_inst_datapath.b2v_inst_temp2.entrada);
end

always @(posedge clock) begin
    $display("Saida Temp2: [%0d]", uut.b2v_inst_datapath.b2v_inst_temp2.saida);
end

always @(posedge clock) begin
    $display("Controle_Pilha: [%0d]", uut.b2v_inst_datapath.controle_pilha);
end

always @(posedge clock) begin
    $display("Indice pilha: [%0d]", uut.b2v_inst_datapath.b2v_inst_pilha.indice);
end

always @(posedge clock) begin
    $display("Proximo indice da pilha: [%0d]", uut.b2v_inst_datapath.b2v_inst_pilha.prox_indice);
end

// Inicializar entradas
initial begin
    reset = 1;
    #10
    reset = 0;
    // Aguardar alguns ciclos
    #200;
    $display("Resultado= %d", uut.b2v_inst_datapath.b2v_inst_ula.resultado);
    // // Ativar o reset do datapath
    // reset = 1;

    // // Aguardar alguns ciclos
    // #10;

    // // Desativar o reset do datapath
    // reset = 0;

    // Outros testes podem ser adicionados conforme necessário

    $stop; // Parar a simulação
end

endmodule
