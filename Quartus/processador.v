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
// CREATED		"Fri Dec 15 01:08:13 2023"

module processador(
	clock,
	reset_UC,
	reset_datapath,
	tos
);


input wire	clock;
input wire	reset_UC;
input wire	reset_datapath;
output wire	[15:0] tos;

wire	SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_1;
wire	SYNTHESIZED_WIRE_2;
wire	SYNTHESIZED_WIRE_3;
wire	SYNTHESIZED_WIRE_4;
wire	SYNTHESIZED_WIRE_5;
wire	SYNTHESIZED_WIRE_6;
wire	[15:0] SYNTHESIZED_WIRE_7;
wire	[4:0] SYNTHESIZED_WIRE_8;
wire	SYNTHESIZED_WIRE_9;
wire	SYNTHESIZED_WIRE_10;
wire	[4:0] SYNTHESIZED_WIRE_11;
wire	[15:0] SYNTHESIZED_WIRE_12;
wire	SYNTHESIZED_WIRE_13;
wire	[4:0] SYNTHESIZED_WIRE_14;
wire	SYNTHESIZED_WIRE_15;
wire	[15:0] SYNTHESIZED_WIRE_16;
wire	[9:0] SYNTHESIZED_WIRE_17;





datapath	b2v_inst_datapath(
	.reset(reset_datapath),
	.wren(SYNTHESIZED_WIRE_0),
	.controle_pilha(SYNTHESIZED_WIRE_1),
	.clk_pilha(SYNTHESIZED_WIRE_2),
	.clk_temp2(SYNTHESIZED_WIRE_3),
	.load_temp2(SYNTHESIZED_WIRE_4),
	.load_temp1(SYNTHESIZED_WIRE_5),
	.clk_temp1(SYNTHESIZED_WIRE_6),
	.din_UC(SYNTHESIZED_WIRE_7),
	.opcode(SYNTHESIZED_WIRE_8),
	.data_uc(SYNTHESIZED_WIRE_15),
	.dout(SYNTHESIZED_WIRE_12),
	.tos(tos));


RAM	b2v_inst_RAM(
	.wren(SYNTHESIZED_WIRE_9),
	.clock(SYNTHESIZED_WIRE_10),
	.address(SYNTHESIZED_WIRE_11),
	.data(SYNTHESIZED_WIRE_12),
	.q(SYNTHESIZED_WIRE_16));


ROM	b2v_inst_ROM(
	.clock(SYNTHESIZED_WIRE_13),
	.address(SYNTHESIZED_WIRE_14),
	.q(SYNTHESIZED_WIRE_17));


UC	b2v_inst_UC(
	.clock(clock),
	.reset(reset_UC),
	.controle_ula(SYNTHESIZED_WIRE_15),
	.data_mem(SYNTHESIZED_WIRE_16),
	.inst(SYNTHESIZED_WIRE_17),
	.pilha_wren(SYNTHESIZED_WIRE_0),
	.ram_wren(SYNTHESIZED_WIRE_9),
	.controle_pilha(SYNTHESIZED_WIRE_1),
	.clock_pilha(SYNTHESIZED_WIRE_2),
	.clock_rom(SYNTHESIZED_WIRE_13),
	.clock_ram(SYNTHESIZED_WIRE_10),
	.load_temp1(SYNTHESIZED_WIRE_5),
	.load_temp2(SYNTHESIZED_WIRE_4),
	.clock_temp1(SYNTHESIZED_WIRE_6),
	.clock_temp2(SYNTHESIZED_WIRE_3),
	.a_ram(SYNTHESIZED_WIRE_11),
	.a_rom(SYNTHESIZED_WIRE_14),
	.data_pilha(SYNTHESIZED_WIRE_7),
	.opcode(SYNTHESIZED_WIRE_8));
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
