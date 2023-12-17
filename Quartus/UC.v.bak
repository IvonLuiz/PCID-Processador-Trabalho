module ULA( operando1, operando2, opcode, resultado );


input [15:0] operando1;
input [15:0] operando2;
input [2:0] opcode;

output [31:0] resultado;

reg [31:0] resultado;


always@(operando1 or operando2 or opcode)
begin
	case (opcode)
		
		3'b000:
			resultado = operando1 + operando2;
		3'b001:
			resultado = operando1 - operando2;
		3'b010:
			resultado = operando1 / operando2;
		3'b011:
			resultado = operando1 * operando2;  
		3'b100:
			resultado = operando1 & operando2; 
		3'b101:
			resultado = operando1 | operando2;
		3'b110:
			resultado = ~operando1;
		3'b111:
			resultado = operando1 ^ operando1;
		default:
			resultado = 0;
	endcase
end

endmodule