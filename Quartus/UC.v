module UC (
input clock,
input reset,
input [11:0] inst,
input [7:0] data_mem,
output reg [4:0] opcode,
output reg controle_pilha,
output reg clock_pilha,
output reg [4:0] a_rom,
output reg clock_rom,
output reg [7:0] data_pilha,
output reg pilha_wren,
output reg ram_wren,
output reg [4:0] a_ram,
output reg clock_ram,
output reg clock_temp1,
output reg load_temp1,
);

//rom é a instrução e ram a data
parameter	Inicio = 5'b00000,
				Ler_ROM = 5'b00001,
				Enviar_Opcode = 5'b00010,
				Decodificar = 5'b00011,
				Push = 5'b00100,
				Push2 = 5'b00101,
				Push_I = 5'b00110,
				Push_T = 5'b00111,
				Push_T2 = 5'b01000,
				Pop = 5'b01001,
				Pop2 = 5'b01010,
				Aritmetica = 5'b01011,
				Aritmetica2 = 5'b01100,
				Aritmetica3 = 5'b01101,
				Aritmetica4 = 5'b01110,
				Aritmetica5 = 5'b01111,
				Aritmetica6 = 5'b10000,
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
		Ler_ROM: 			estado_futuro = Decodificar;
		Decodificar: 		if(inst[15:8] == 0)
									estado_futuro = Push;
								if(inst[15:8] == 1)
									estado_futuro = Push_I;
								if(inst[15:8] == 2)
									estado_futuro = Push_T;
								if(inst[15:8] == 3)
									estado_futuro = Pop;
								if(inst[15:8] == 4 || inst[15:8] == 5 || inst[15:8] == 6 || inst[15:8] == 7 || inst[15:8] == 8 || inst[15:8] == 9 || inst[15:8] == 10 || inst[15:8] == 11 || inst[15:8] == 12)
									estado_futuro = Aritmetica;
								if(inst[15:8] == 13)
									estado_futuro = Not;
		Push:             estado_futuro = Push2;
		Push2: 				estado_futuro = Encerrar;
		Push_I: 				estado_futuro = Encerrar;
		Push_T: 				estado_futuro = Push_T2;,
		Push_T2: 			estado_futuro = Encerrar;
		Pop: 					estado_futuro = Pop2;
		Pop2: 				estado_futuro = Encerrar;
		Aritmetica: 	estado_futuro = Aritmetica2;
		Aritmetica2: 	estado_futuro = Aritmetica3;
		Aritmetica3: 	estado_futuro = Aritmetica4;
		Aritmetica4: 	estado_futuro = Aritmetica5;
		Aritmetica5: 	estado_futuro = Aritmetica6;
		Aritmetica6: 	estado_futuro = Encerrar;		
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
	clock_temp1 = 0;
	clock_pilha = 0;
	load_temp1 = 0;
	controle_pilha = 0;
	a_rom= 0;
	a_ram = 0;
	pilha_wren = 0;
	ram_wren = 0;
	case (estado_atual)
		Ler_ROM:				begin
									clock_rom = 1;
								end
		Push:
								begin
									a_ram = inst[7:0];
									ram_wren = 0;
									clock_ram = 1;
								end
		Push2:
								begin
									data_pilha [7:0] = data_mem [7:0];
									pilha_wren = 1;
									clock_pilha = 1;
									controle_pilha = 0;
								end
		Push_I:
								begin
									data_pilha [7:0] = inst [7:0];
									pilha_wren = 1;
									clock_pilha = 1;
									controle_pilha = 0;
								end
		Push_T:
								begin
									clock_temp1 = 1;
									opcode[4:0] = inst[11:8];
								end
		Push_T2:
								begin
									controle_pilha = 2'b01;
									clock_pilha = 1;
									pilha_wren = 1;
									controle_pilha = 1;
								end
		Pop:
								begin
									pilha_wren = 0;
									clock_pilha = 1;
								end
		Pop2:
								begin
									a_ram = inst[7:0];
									ram_wren = 1;
									clock_ram = 1;
								end
		Aritmetica1: 	
								begin
									pilha_wren = 0;
									clock_pilha = 1;
								end
		Aritmetica2: 	
								begin
									load_temp1 = 1;
									clock_temp1 = 1;
									clock_pilha = 0;
								end
		Aritmetica3: 
								begin
									clock_pilha1 = 1;
								end
		Aritmetica4:
								begin
									load_temp2 = 1;
									clock_temp2 = 1;
									clock_pilha = 0;
								end	
		Aritmetica5:
								begin
									opcode[4:0] = inst[11:8];
								end					
		Aritmetica6:
								begin
									controle_pilha = 2'b01;
									clock_pilha = 1;
									pilha_wren = 1;
									controle_pilha = 1;
								end
		Not:
								begin
									pilha_wren = 0;
									clock_pilha = 1;
								end
		Not2: 	
								begin
									load_temp1 = 1;
									clock_temp1 = 1;
									clock_pilha = 0;
								end
		Not3: 	
								begin
									opcode[4:0] = inst[11:8];
								end
		Not4: 	
								begin
									controle_pilha = 2'b01;
									clock_pilha = 1;
									pilha_wren = 1;
									controle_pilha = 1;
								end
	endcase
end

endmodule 