module datapath(
	clk,
	reset,
	loadTemp2,
	loadTemp1,
	pop,
	push,
	din,
	opcode,
	resultado,
	tos11
);


input wire	clk;
input wire	reset;
input wire	loadTemp2;
input wire	loadTemp1;
input wire	pop;
input wire	push;
input wire	[15:0] din;
input wire	[2:0] opcode;
output wire	[31:0] resultado;
output wire	[15:0] tos;

wire	[15:0] SYNTHESIZED_WIRE_4;
wire	[15:0] SYNTHESIZED_WIRE_2;
wire	[15:0] SYNTHESIZED_WIRE_3;



Pilha	inst_Pilha(
	.clk(clk),
	.rst(reset),
	.pop(pop),
	.push(push),
	.din(din),
	.dout(SYNTHESIZED_WIRE_4),
	.tos(tos));


temp	inst_temp1(
	.clk(clk),
	.loadTemp(loadTemp1),
	.reset(reset),
	.entrada(SYNTHESIZED_WIRE_4),
	.saida(SYNTHESIZED_WIRE_2));


temp	inst_temp2(
	.clk(clk),
	.loadTemp(loadTemp2),
	.reset(reset),
	.entrada(SYNTHESIZED_WIRE_4),
	.saida(SYNTHESIZED_WIRE_3));


ULA	inst_ULA(
	.opcode(opcode),
	.operando1(SYNTHESIZED_WIRE_2),
	.operando2(SYNTHESIZED_WIRE_3),
	.resultado(resultado));


endmodule
