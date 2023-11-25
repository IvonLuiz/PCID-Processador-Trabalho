module ip(clock, incIP, endereco, reset);

input clock;
input incIP
reg [7:0] contador;
output [7:0] endereco;

initial begin
	contador = 8'b00000000;
end 
 

 always @(posedge clock) begin
	
	if (reset == 1) contador <= 8'b00000000;
	
	else if (incIP == 1) contador <= contador + 8'b00000001;
	
	else contador <= contador;

end

assign endereco = contador;

endmodule