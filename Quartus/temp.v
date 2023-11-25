module temp (clk, loadTemp, entrada, saida, reset);

    input clk;
    input loadTemp;
    input reset;
    input [15:0] entrada;
    output [15:0] saida;

    reg [15:0] saida;
    reg [15:0] tempReg;

    always@(clk, loadTemp)
    begin
        @(posedge clk or posedge reset) 
        begin
            if (reset) begin
                // Reset do registrador
                tempReg <= 8'b00000000;
            end else begin
                if ( loadTemp == 1) begin
                    saida <= entrada;
                    tempReg <= entrada;
                end

                else if (loadTemp == 0) begin
                    saida <= tempReg;
                end
            end
        end
    end

endmodule