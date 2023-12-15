`timescale 1ns / 1ps

module TB_Processador;

reg clock;
reg reset_UC;
reg reset_datapath;
wire [15:0] tos;

processador uut (
    .clock(clock),
    .reset_UC(reset_UC),
    .reset_datapath(reset_datapath),
    .tos(tos)
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
    $display("Saida da Pilha: [%0d]", uut.b2v_inst_datapath.dout);
end

always @(posedge clock) begin
    $display("Entrada da Pilha (din_UC): [%0d]", uut.b2v_inst_datapath.b2v_inst_pilha.din_UC);
end

always @(posedge clock) begin
    $display("Entrada da Pilha (din_ULA): [%0d]", uut.b2v_inst_datapath.b2v_inst_pilha.din_ULA);
end

always @(posedge clock) begin
    $display("Entrada Temp: [%0d]", uut.b2v_inst_datapath.b2v_inst_temp1.entrada);
end

always @(posedge clock) begin
    $display("Controle_Pilha: [%0d]", uut.b2v_inst_datapath.controle_pilha);
end

// Inicializar entradas
initial begin
    reset_UC = 1;
    reset_datapath = 1;
    #10
    reset_UC = 0;
    reset_datapath = 0;
    // Aguardar alguns ciclos
    #200;
    $display("Resultado= %d", uut.b2v_inst_datapath.b2v_inst_ula.resultado);
    // // Ativar o reset do datapath
    // reset_datapath = 1;

    // // Aguardar alguns ciclos
    // #10;

    // // Desativar o reset do datapath
    // reset_datapath = 0;

    // Outros testes podem ser adicionados conforme necessário

    $stop; // Parar a simulação
end

endmodule
