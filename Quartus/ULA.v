module ULA( operando1, operando2, opcode, resultado, data_uc );


input [15:0] operando1;
input [15:0] operando2;
input [4:0] opcode;

output [31:0] resultado;
output reg data_uc;

reg [31:0] resultado;


always@(operando1 or operando2 or opcode)
begin
	data_uc = 0;
	case (opcode)
		
		5'b00010:
			resultado = operando1;
		5'b00100:
			resultado = operando1 + operando2;
		5'b00101:
			resultado = operando1 - operando2;
		5'b00110:
			resultado = operando1 * operando2;  
		5'b00111:
			resultado = operando1 / operando2;
		5'b01000:
			resultado = operando1 & operando2; 
		5'b01001:
			resultado = ~(operando1 & operando2); 
		5'b01010:
			resultado = operando1 | operando2;
		5'b01011:
			resultado = operando1 ^ operando1;
		5'b01100:
			if (operando1 == operando2) begin
				resultado = 0;
			end else if (operando1 > operando2) begin
				resultado = 1;
			end else begin
				resultado = -1;
			end
		5'b01101:
			resultado = ~operando1;
		5'b01111:
			if (operando1 == 0)begin
				data_uc = 1;
			end	
		5'b10000:
			if (operando1 > 0)begin
				data_uc = 1;
			end
		5'b10001:
			if (operando1 < 0)begin
				data_uc = 1;
			end
		5'b10010:
			if (operando1 >= 0)begin
				data_uc = 1;
			end
		5'b10011:
			if (operando1 <= 0)begin
				data_uc = 1;
			end
		default:
			resultado = 0;
	endcase
end

endmodule