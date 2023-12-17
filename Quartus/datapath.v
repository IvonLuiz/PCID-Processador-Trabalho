module datapath(
	reset,
	clk_pilha,
	clk_temp2,
	load_temp2,
	load_temp1,
	clk_temp1,
	push,
	pop,
	controle_pilha,
	din_UC,
	opcode,
	data_uc,
	dout
);


input wire	reset;
input wire	clk_pilha;
input wire	clk_temp2;
input wire	load_temp2;
input wire	load_temp1;
input wire	clk_temp1;
input wire	push;
input wire	pop;
input wire	controle_pilha;
input wire	[15:0] din_UC;
input wire	[4:0] opcode;
output wire	data_uc;
output wire	[15:0] dout;

wire	[31:0] SYNTHESIZED_WIRE_0;
wire	[15:0] SYNTHESIZED_WIRE_5;
wire	[15:0] SYNTHESIZED_WIRE_3;
wire	[15:0] SYNTHESIZED_WIRE_4;

assign	dout = SYNTHESIZED_WIRE_5;




Pilha	b2v_inst_pilha(
	.clk(clk_pilha),
	.rst(reset),
	.push(push),
	.pop(pop),
	.controle_pilha(controle_pilha),
	.din_UC(din_UC),
	.din_ULA(SYNTHESIZED_WIRE_0),
	.dout(SYNTHESIZED_WIRE_5));


temp	b2v_inst_temp1(
	.clk(clk_temp1),
	.loadTemp(load_temp1),
	.reset(reset),
	.entrada(SYNTHESIZED_WIRE_5),
	.saida(SYNTHESIZED_WIRE_3));


temp	b2v_inst_temp2(
	.clk(clk_temp2),
	.loadTemp(load_temp2),
	.reset(reset),
	.entrada(SYNTHESIZED_WIRE_5),
	.saida(SYNTHESIZED_WIRE_4));


ULA	b2v_inst_ula(
	.opcode(opcode),
	.operando1(SYNTHESIZED_WIRE_3),
	.operando2(SYNTHESIZED_WIRE_4),
	.data_uc(data_uc),
	.resultado(SYNTHESIZED_WIRE_0));


endmodule
