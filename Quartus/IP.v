module IP(clk, incIP, endereco, reset);

input clk;
input incIP;
input reset;

output [7:0] endereco;

reg [7:0] contador;

initial begin
	contador = 8'b00000000;
end 


always @(posedge clk) begin
	
	if (reset == 1) contador <= 8'b00000000;
	
	else if (incIP == 1) contador <= contador + 8'b00000001;
	
	else contador <= contador;

end

assign endereco = contador;

endmodule