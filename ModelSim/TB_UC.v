`timescale 1ns / 1ps

module TB_UC;

reg clock;
reg reset;
reg [9:0] inst;
reg [15:0] data_mem;
reg controle_ula;
reg [15:0] desvio;
wire pilha_wren, ram_wren, controle_pilha, clock_pilha, clock_rom, clock_ram, load_temp1, load_temp2;
wire [4:0] a_rom, a_ram, opcode;
wire [15:0] data_pilha;

UC uut (
    .clock(clock),
    .reset(reset),
    .inst(inst),
    .data_mem(data_mem),
    .controle_ula(controle_ula),
    .pilha_wren(pilha_wren),
    .ram_wren(ram_wren),
    .controle_pilha(controle_pilha),
    .clock_pilha(clock_pilha),
    .clock_rom(clock_rom),
    .a_rom(a_rom),
    .data_pilha(data_pilha),
    .a_ram(a_ram),
    .clock_ram(clock_ram),
    .load_temp1(load_temp1),
    .load_temp2(load_temp2),
    .clock_temp1(clock_temp1),
    .clock_temp2(clock_temp2),
    .opcode(opcode)
);


// Gerar clock
initial begin
    clock = 0;
    forever #5 clock = ~clock;
end

initial begin
    $monitor($time, " estado_atual='%0d", uut.estado_atual);
end

always @(posedge clock) begin
    $display("ESTADO ATUAL: [%0d]", uut.estado_atual);
end


initial begin
    reset = 1;
    inst = 10'b0;
    data_mem = 16'b0;
    controle_ula = 0;
    desvio = 16'b0;

    // Desativar o reset
    reset = 0;

    #5
    // Push fodase
    inst = 10'b0001000101;
    #140
    reset = 1;
    #5
    reset = 0;
    #5
    inst = 10'b0000100101;
    // $display("ESTADO ATUAL: [%0d]", uut.estado_atual);

    // Outros testes podem ser adicionados conforme necessário

    $stop; // Parar a simulação
end



endmodule
