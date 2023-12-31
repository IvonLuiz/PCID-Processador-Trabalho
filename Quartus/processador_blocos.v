module processador_blocos(
	reset,
	clock
);


input wire	reset;
input wire	clock;

wire	SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_1;
wire	SYNTHESIZED_WIRE_2;
wire	SYNTHESIZED_WIRE_3;
wire	SYNTHESIZED_WIRE_4;
wire	SYNTHESIZED_WIRE_5;
wire	SYNTHESIZED_WIRE_6;
wire	SYNTHESIZED_WIRE_7;
wire	[15:0] SYNTHESIZED_WIRE_8;
wire	[4:0] SYNTHESIZED_WIRE_9;
wire	SYNTHESIZED_WIRE_10;
wire	SYNTHESIZED_WIRE_11;
wire	[4:0] SYNTHESIZED_WIRE_12;
wire	[15:0] SYNTHESIZED_WIRE_13;
wire	SYNTHESIZED_WIRE_14;
wire	[4:0] SYNTHESIZED_WIRE_15;
wire	SYNTHESIZED_WIRE_16;
wire	[15:0] SYNTHESIZED_WIRE_17;
wire	[9:0] SYNTHESIZED_WIRE_18;





datapath	b2v_inst_datapath(
	.reset(reset),
	.clk_pilha(SYNTHESIZED_WIRE_0),
	.clk_temp2(SYNTHESIZED_WIRE_1),
	.load_temp2(SYNTHESIZED_WIRE_2),
	.load_temp1(SYNTHESIZED_WIRE_3),
	.clk_temp1(SYNTHESIZED_WIRE_4),
	.push(SYNTHESIZED_WIRE_5),
	.pop(SYNTHESIZED_WIRE_6),
	.controle_pilha(SYNTHESIZED_WIRE_7),
	.din_UC(SYNTHESIZED_WIRE_8),
	.opcode(SYNTHESIZED_WIRE_9),
	.data_uc(SYNTHESIZED_WIRE_16),
	.dout(SYNTHESIZED_WIRE_13));


RAM	b2v_inst_RAM(
	.wren(SYNTHESIZED_WIRE_10),
	.clock(SYNTHESIZED_WIRE_11),
	.address(SYNTHESIZED_WIRE_12),
	.data(SYNTHESIZED_WIRE_13),
	.q(SYNTHESIZED_WIRE_17));


ROM	b2v_inst_ROM(
	.clock(SYNTHESIZED_WIRE_14),
	.address(SYNTHESIZED_WIRE_15),
	.q(SYNTHESIZED_WIRE_18));


UC	b2v_inst_UC(
	.clock(clock),
	.reset(reset),
	.controle_ula(SYNTHESIZED_WIRE_16),
	.data_mem(SYNTHESIZED_WIRE_17),
	.inst(SYNTHESIZED_WIRE_18),
	.clock_ram(SYNTHESIZED_WIRE_11),
	.ram_wren(SYNTHESIZED_WIRE_10),
	.clock_rom(SYNTHESIZED_WIRE_14),
	.controle_pilha(SYNTHESIZED_WIRE_7),
	.clock_pilha(SYNTHESIZED_WIRE_0),
	.push(SYNTHESIZED_WIRE_5),
	.pop(SYNTHESIZED_WIRE_6),
	.clock_temp1(SYNTHESIZED_WIRE_4),
	.load_temp1(SYNTHESIZED_WIRE_3),
	.clock_temp2(SYNTHESIZED_WIRE_1),
	.load_temp2(SYNTHESIZED_WIRE_2),
	.a_ram(SYNTHESIZED_WIRE_12),
	.a_rom(SYNTHESIZED_WIRE_15),
	.data_pilha(SYNTHESIZED_WIRE_8),
	.opcode(SYNTHESIZED_WIRE_9));
	defparam	b2v_inst_UC.Aritmetica1 = 5'b01011;
	defparam	b2v_inst_UC.Aritmetica2 = 5'b01100;
	defparam	b2v_inst_UC.Aritmetica3 = 5'b01101;
	defparam	b2v_inst_UC.Aritmetica4 = 5'b01110;
	defparam	b2v_inst_UC.Aritmetica5 = 5'b01111;
	defparam	b2v_inst_UC.Aritmetica6 = 5'b10000;
	defparam	b2v_inst_UC.Condicional1 = 5'b10111;
	defparam	b2v_inst_UC.Condicional2 = 5'b11000;
	defparam	b2v_inst_UC.Condicional3 = 5'b11001;
	defparam	b2v_inst_UC.Decodificar = 5'b00011;
	defparam	b2v_inst_UC.Encerrar = 5'b11111;
	defparam	b2v_inst_UC.Enviar_Opcode = 5'b00010;
	defparam	b2v_inst_UC.Goto1 = 5'b10101;
	defparam	b2v_inst_UC.Goto2 = 5'b10110;
	defparam	b2v_inst_UC.Inicio = 5'b00000;
	defparam	b2v_inst_UC.Ler_ROM = 5'b00001;
	defparam	b2v_inst_UC.Not1 = 5'b10001;
	defparam	b2v_inst_UC.Not2 = 5'b10010;
	defparam	b2v_inst_UC.Not3 = 5'b10011;
	defparam	b2v_inst_UC.Not4 = 5'b10100;
	defparam	b2v_inst_UC.Pop = 5'b01001;
	defparam	b2v_inst_UC.Pop2 = 5'b01010;
	defparam	b2v_inst_UC.Push = 5'b00100;
	defparam	b2v_inst_UC.Push2 = 5'b00101;
	defparam	b2v_inst_UC.Push_I = 5'b00110;
	defparam	b2v_inst_UC.Push_T = 5'b00111;
	defparam	b2v_inst_UC.Push_T2 = 5'b01000;


endmodule
