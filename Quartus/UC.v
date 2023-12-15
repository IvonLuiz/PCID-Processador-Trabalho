module UC (
	input clock,
	input reset,
	input [9:0] inst,
	input [15:0] data_mem,
	input controle_ula,

	output reg pilha_wren,
	output reg ram_wren,
	output reg controle_pilha,
	output reg clock_pilha,
	output reg clock_rom,
	output reg [4:0] a_rom,
	output reg [15:0] data_pilha,
	output reg [4:0] a_ram,
	output reg clock_ram,
	output reg load_temp1,
	output reg load_temp2,
	output reg clock_temp1,
	output reg clock_temp2,
	output reg [4:0] opcode
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
				Aritmetica1 = 5'b01011,
				Aritmetica2 = 5'b01100,
				Aritmetica3 = 5'b01101,
				Aritmetica4 = 5'b01110,
				Aritmetica5 = 5'b01111,
				Aritmetica6 = 5'b10000,
				Not1 = 5'b10001,
				Not2 = 5'b10010,
				Not3 = 5'b10011,
				Not4 = 5'b10100,
				Goto1 = 5'b10101,
				Goto2 = 5'b10110,
				Condicional1 = 5'b10111,
				Condicional2 = 5'b11000,
				Condicional3 = 5'b11001,
				Encerrar = 5'b11111;
				
				
				
reg [4:0] estado_atual, estado_futuro;
reg [15:0] desvio; 

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
		Decodificar: 		if(inst[9:5] == 0)
									estado_futuro = Push;
								else if(inst[9:5] == 1)
									estado_futuro = Push_I;
								else if(inst[9:5] == 2)
									estado_futuro = Push_T;
								else if(inst[9:5] == 3)
									estado_futuro = Pop;
								else if(inst[9:5] == 4 || inst[9:5] == 5 || inst[9:5] == 6 || inst[9:5] == 7 || inst[9:5] == 8 || inst[9:5] == 9 || inst[9:5] == 10 || inst[9:5] == 11 || inst[9:5] == 12)
									estado_futuro = Aritmetica1;
								else if(inst[9:5] == 13)
									estado_futuro = Not1;
								else if(inst[9:5] == 14)
								   estado_futuro = Goto1;
								else if(inst[9:5] == 15 || inst[9:5] == 16 || inst[9:5] == 17 || inst[9:5] == 18 || inst[9:5] == 19)
									estado_futuro = Condicional1;
		Push:             estado_futuro = Push2;
		Push2: 				estado_futuro = Encerrar;
		Push_I: 				estado_futuro = Encerrar;
		Push_T: 				estado_futuro = Push_T2;
		Push_T2: 			estado_futuro = Encerrar;
		Pop: 					estado_futuro = Pop2;
		Pop2: 				estado_futuro = Encerrar;
		Aritmetica1: 	estado_futuro = Aritmetica2;
		Aritmetica2: 	estado_futuro = Aritmetica3;
		Aritmetica3: 	estado_futuro = Aritmetica4;
		Aritmetica4: 	estado_futuro = Aritmetica5;
		Aritmetica5: 	estado_futuro = Aritmetica6;
		Aritmetica6: 	estado_futuro = Encerrar;	
		Not1: 		estado_futuro = Not2;
		Not2: 	estado_futuro = Not3;
		Not3: 	estado_futuro = Not4;
		Not4: 	estado_futuro = Encerrar;
		Goto1:		estado_futuro = Goto2;
		Goto2:		estado_futuro = Encerrar;
		Condicional1:  	estado_futuro = Condicional2;
		Condicional2:  	estado_futuro = Condicional3;
		Condicional3:  	if(controle_ula == 1)
									estado_futuro = Goto1;
								else
									estado_futuro = Encerrar;
		Encerrar: 		estado_futuro = Ler_ROM;
		default: estado_futuro = Inicio;
	endcase
end

// dec saida
always @ (*)
begin
	case (estado_atual)
		Inicio:
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
									desvio = 0;
								end
		Ler_ROM:				begin
									clock_rom = 1;
								end
		Push:
								begin
									a_ram = inst[4:0];
									ram_wren = 0;
									clock_ram = 1;
								end
		Push2:
								begin
									data_pilha[15:0] = data_mem[15:0];
									pilha_wren = 1;
									clock_pilha = 1;
									controle_pilha = 0;
								end
		Push_I:
								begin
									data_pilha[15:0] = inst[4:0];
									pilha_wren = 1;
									clock_pilha = 1;
									controle_pilha = 0;
								end
		Push_T:
								begin
									clock_temp1 = 1;
									opcode[4:0] = inst[9:5];
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
									a_ram = inst[4:0];
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
									clock_pilha = 1;
								end
		Aritmetica4:
								begin
									load_temp2 = 1;
									clock_temp2 = 1;
									clock_pilha = 0;
								end	
		Aritmetica5:
								begin
									opcode[4:0] = inst[9:5];
								end					
		Aritmetica6:
								begin
									controle_pilha = 2'b01;
									clock_pilha = 1;
									pilha_wren = 1;
									controle_pilha = 1;
								end
		Not1:
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
									opcode[4:0] = inst[9:5];
								end
		Not4: 	
								begin
									controle_pilha = 2'b01;
									clock_pilha = 1;
									pilha_wren = 1;
									controle_pilha = 1;
								end
		Goto1:
								begin
									a_ram = inst[4:0];
									ram_wren = 0;
									clock_ram = 1;
								end
		Goto2:
								begin
									desvio[15:0] = data_mem[15:0];
								end
		Condicional1:		
								begin
									pilha_wren = 0;
									clock_pilha = 1;
								end
		Condicional2: 	
								begin
									load_temp1 = 1;
									clock_temp1 = 1;
									clock_pilha = 0;
								end
		Condicional3: 	
								begin
									opcode[4:0] = inst[9:5];
								end
		Encerrar:
								begin
									a_rom = a_rom + 1;
									clock_rom = 0;
									clock_ram = 0;
								end
	endcase
end

endmodule 