`timescale 1ns / 1ps

module TB_Processador;

reg clock;
reg reset;

processador_blocos uut (
    .clock(clock),
    .reset(reset)
);

// Gerar clock
initial begin
    clock = 0;
    forever #5 clock = ~clock;
end

initial begin
    $monitor($time, ": Estado_atual='%0d", uut.b2v_inst_UC.estado_atual);
end

always @(posedge clock) begin
    $display("Addres ROM: [%0d]", uut.b2v_inst_UC.a_rom);
    $display("Data mem: [%b]", uut.b2v_inst_UC.data_mem);
    $display("Saida da Pilha: [%b]", uut.b2v_inst_datapath.b2v_inst_pilha.dout);
    $display("Entrada da Pilha (din_UC): [%b]", uut.b2v_inst_datapath.b2v_inst_pilha.din_UC);
    $display("Entrada da Pilha (din_ULA): [%b]", uut.b2v_inst_datapath.b2v_inst_pilha.din_ULA);
    $display("Entrada Temp1: [%0d]", uut.b2v_inst_datapath.b2v_inst_temp1.entrada);
    $display("Saida Temp1: [%0d]", uut.b2v_inst_datapath.b2v_inst_temp1.saida);
    $display("Entrada Temp2: [%0d]", uut.b2v_inst_datapath.b2v_inst_temp2.entrada);
    $display("Saida Temp2: [%0d]", uut.b2v_inst_datapath.b2v_inst_temp2.saida);
    $display("Controle_Pilha: [%0d]", uut.b2v_inst_datapath.controle_pilha);
    $display("Topo da pilha: [%0d]", uut.b2v_inst_datapath.b2v_inst_pilha.indice);
end



// Inicializar entradas
initial begin
    reset = 1;
    #10
    reset = 0;
    #195
    $display("Resultado da ULA = %d", uut.b2v_inst_datapath.b2v_inst_ula.resultado);
    // $stop; // Parar a simulação
end

endmodule
