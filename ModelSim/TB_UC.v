`timescale 1ns / 1ps

module TB_UC;

reg clock;
reg reset;
reg [9:0] inst;
reg [15:0] data_mem;
reg controle_ula;
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


// Generate clock
initial begin
    clock = 0;
    forever #5 clock = ~clock;
end

initial begin
    $monitor($time, "Estado_atual='%0d", uut.estado_atual);
end

// always @(posedge clock) begin
//     $display("ESTADO ATUAL: [%0d]", uut.estado_atual);
// end


// Task para testar instruções
task automatic testar_instrucao(input [4:0] opcode, input [4:0] data_value, input integer tempo);
    begin
        // inst = 10'b0;
        data_mem = 16'b0;
        controle_ula = 0;
        #10

        $display("Testando %d", opcode);
        // $display("A_rom: %d", uut.a_rom);
        inst = {opcode, data_value};    // Concatenar instruções e dado
        
        #tempo;

        $display("Resultado no inst %b \n", uut.inst);
    end
endtask


initial begin
    $monitor($time, " estado_atual='%0d", uut.estado_atual);
    
    testar_instrucao(0, 5'b00000, 50);

    testar_instrucao(1, 5'b00000, 35);

    testar_instrucao(2, 5'b00000, 40);

    testar_instrucao(3, 5'b00000, 40);

    testar_instrucao(4, 5'b00000, 80);

    testar_instrucao(13, 5'b00000, 60);

    testar_instrucao(14, 5'b00000, 35);

    testar_instrucao(15, 5'b00000, 50);

    $stop; 
end

endmodule
