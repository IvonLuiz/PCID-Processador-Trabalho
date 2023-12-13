// Copyright (C) 2018  Intel Corporation. All rights reserved.
// Your use of Intel Corporation's design tools, logic functions 
// and other software and tools, and its AMPP partner logic 
// functions, and any output files from any of the foregoing 
// (including device programming or simulation files), and any 
// associated documentation or information are expressly subject 
// to the terms and conditions of the Intel Program License 
// Subscription Agreement, the Intel Quartus Prime License Agreement,
// the Intel FPGA IP License Agreement, or other applicable license
// agreement, including, without limitation, that your use is for
// the sole purpose of programming logic devices manufactured by
// Intel and sold by Intel or its authorized distributors.  Please
// refer to the applicable agreement for further details.

// PROGRAM		"Quartus Prime"
// VERSION		"Version 18.1.0 Build 625 09/12/2018 SJ Lite Edition"
// CREATED		"Tue Dec 12 20:28:59 2023"

module processador(
);



wire	SYNTHESIZED_WIRE_0;
wire	[15:0] SYNTHESIZED_WIRE_1;
wire	[9:0] SYNTHESIZED_WIRE_2;
wire	SYNTHESIZED_WIRE_3;
wire	SYNTHESIZED_WIRE_4;
wire	SYNTHESIZED_WIRE_5;
wire	SYNTHESIZED_WIRE_6;
wire	SYNTHESIZED_WIRE_7;
wire	SYNTHESIZED_WIRE_8;
wire	SYNTHESIZED_WIRE_9;
wire	[15:0] SYNTHESIZED_WIRE_10;
wire	[4:0] SYNTHESIZED_WIRE_11;
wire	SYNTHESIZED_WIRE_12;
wire	SYNTHESIZED_WIRE_13;
wire	[4:0] SYNTHESIZED_WIRE_14;
wire	[15:0] SYNTHESIZED_WIRE_15;
wire	SYNTHESIZED_WIRE_16;
wire	[4:0] SYNTHESIZED_WIRE_17;





UC	b2v_inst(
	
	
	.controle_ula(SYNTHESIZED_WIRE_0),
	.data_mem(SYNTHESIZED_WIRE_1),
	.inst(SYNTHESIZED_WIRE_2),
	.pilha_wren(SYNTHESIZED_WIRE_3),
	.ram_wren(SYNTHESIZED_WIRE_12),
	.controle_pilha(SYNTHESIZED_WIRE_4),
	.clock_pilha(SYNTHESIZED_WIRE_5),
	.clock_rom(SYNTHESIZED_WIRE_16),
	.clock_ram(SYNTHESIZED_WIRE_13),
	.load_temp1(SYNTHESIZED_WIRE_8),
	.load_temp2(SYNTHESIZED_WIRE_7),
	.clock_temp1(SYNTHESIZED_WIRE_9),
	.clock_temp2(SYNTHESIZED_WIRE_6),
	.a_ram(SYNTHESIZED_WIRE_14),
	.a_rom(SYNTHESIZED_WIRE_17),
	.data_pilha(SYNTHESIZED_WIRE_10),
	.opcode(SYNTHESIZED_WIRE_11));
	defparam	b2v_inst.Aritmetica1 = 5'b01011;
	defparam	b2v_inst.Aritmetica2 = 5'b01100;
	defparam	b2v_inst.Aritmetica3 = 5'b01101;
	defparam	b2v_inst.Aritmetica4 = 5'b01110;
	defparam	b2v_inst.Aritmetica5 = 5'b01111;
	defparam	b2v_inst.Aritmetica6 = 5'b10000;
	defparam	b2v_inst.Condicional1 = 5'b10111;
	defparam	b2v_inst.Condicional2 = 5'b11000;
	defparam	b2v_inst.Condicional3 = 5'b11001;
	defparam	b2v_inst.Decodificar = 5'b00011;
	defparam	b2v_inst.Encerrar = 5'b11111;
	defparam	b2v_inst.Enviar_Opcode = 5'b00010;
	defparam	b2v_inst.Goto1 = 5'b10101;
	defparam	b2v_inst.Goto2 = 5'b10110;
	defparam	b2v_inst.Inicio = 5'b00000;
	defparam	b2v_inst.Ler_ROM = 5'b00001;
	defparam	b2v_inst.Not1 = 5'b10001;
	defparam	b2v_inst.Not2 = 5'b10010;
	defparam	b2v_inst.Not3 = 5'b10011;
	defparam	b2v_inst.Not4 = 5'b10100;
	defparam	b2v_inst.Pop = 5'b01001;
	defparam	b2v_inst.Pop2 = 5'b01010;
	defparam	b2v_inst.Push = 5'b00100;
	defparam	b2v_inst.Push2 = 5'b00101;
	defparam	b2v_inst.Push_I = 5'b00110;
	defparam	b2v_inst.Push_T = 5'b00111;
	defparam	b2v_inst.Push_T2 = 5'b01000;


datapath	b2v_inst1(
	
	.wren(SYNTHESIZED_WIRE_3),
	.controle_pilha(SYNTHESIZED_WIRE_4),
	.clk_pilha(SYNTHESIZED_WIRE_5),
	.clk_temp2(SYNTHESIZED_WIRE_6),
	.load_temp2(SYNTHESIZED_WIRE_7),
	.load_temp1(SYNTHESIZED_WIRE_8),
	.clk_temp1(SYNTHESIZED_WIRE_9),
	.din_UC(SYNTHESIZED_WIRE_10),
	.opcode(SYNTHESIZED_WIRE_11),
	.data_uc(SYNTHESIZED_WIRE_0),
	.dout(SYNTHESIZED_WIRE_15)
	);


RAM	b2v_inst2(
	.wren(SYNTHESIZED_WIRE_12),
	.clock(SYNTHESIZED_WIRE_13),
	.address(SYNTHESIZED_WIRE_14),
	.data(SYNTHESIZED_WIRE_15),
	.q(SYNTHESIZED_WIRE_1));


ROM	b2v_inst3(
	.clock(SYNTHESIZED_WIRE_16),
	.address(SYNTHESIZED_WIRE_17),
	.q(SYNTHESIZED_WIRE_2));


endmodule
