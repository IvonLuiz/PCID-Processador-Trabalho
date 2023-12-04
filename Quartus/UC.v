module UC (
input clock,
input reset,
input [15:0] inst,
input [7:0] data_mem,
output reg [15:0] opcode,
output reg [4:0] a_rom,
output reg lock_rom,
output reg data_pilha,
output reg pilha_wren,
output reg ram_wren,
output reg [4:0] a_ram,
output reg clock_ram,
output reg [5:0] i
);

//rom é a instrução e ram a data
parameter	Inicio = 5'b00000,
				Ler_ROM = 5'b00001,
				Enviar_Opcode = 5'b00010,
				Decodificar = 5'b00011,
				Push = 5'b00100,
				Push2 = 5'b00101,
				Encerrar = ;
				
reg [4:0] estado_atual, estado_futuro;

// reg estado
always @ (posedge clock)
begin
	if (reset)
	begin
		estado_atual <= Inicio;
	end
	else
	begin
		estado_atual <= estado_futuro;
	end
end

// dec proximo estado
always @ (*)
begin
	case (estado_atual)
		Inicio: 				estado_futuro = Ler_ROM;
		Ler_ROM: 			estado_futuro = Enviar_Opcode;
		Enviar_Opcode: 	estado_futuro = Decodificar
		Decodificar: 		if(inst == 0)
									estado_futuro = Push;
		Push:             estado_futuro = Push2;
		push2: 				estado_futuro = Encerrar;
		Encerrar: 			estado_futuro = Encerrar;
		default: estado_futuro = Inicio;
	endcase
end

// dec saida
always @ (*)
begin
	// atribuicoes default
	clock_rom = 0;
	clock_ram = 0;
	a_rom= 0;
	a_ram = 31;
	pilha_wren = 0;
	ram_wren = 0;
	case (estado_atual)
		Ler_ROM:				begin
									a_rom = i;
									clock_rom = 1;
								end
		Enviar_Opcode:
								begin
									opcode = inst;
								end
		Push:
								begin
									a_ram = i;
									ram_wren = 0;
									clock_ram = 1;
								end
		Push2:
								begin
									data_pilha = data_mem;
									pilha_wren = 1;
								end
								
	endcase
end

endmodule 