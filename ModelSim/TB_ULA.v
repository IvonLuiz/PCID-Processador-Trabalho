// `timescale 1ns / 1ns

module TB_ULA;

reg [15:0] operando1, operando2;
reg [4:0] opcode;
wire [31:0] resultado;

integer i;

// Instantiation of ALU
ULA uut(operando1, operando2, opcode, resultado);

// Initialization
initial begin
operando1 = 50; operando2 = 10; opcode = 0;

for(i = 1; i < 16; i = i+ 1)begin
    #10
    opcode = i;
end

#10
$finish();

end

endmodule