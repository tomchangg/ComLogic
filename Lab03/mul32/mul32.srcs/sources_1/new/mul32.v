`timescale 1ns / 1ps

module mul32(
    input clk,
    input rst,
    input [31:0] multiplicand,   
    input [31:0] multiplier,     
    input start,                
    output reg [63:0] product,  
    output finish      
    );

    integer cnt = 0;
    reg fin;

    assign finish = fin;
    always @(posedge clk or posedge start or rst) begin
        if(rst) begin
            product <= 64'h0;
            fin <= 1'b0;
        end
        else if(start) begin
            product[63:0] <= {32'b0,multiplier};
            cnt <= 0;
            fin = 1'b0;
            end
        else begin  
            if(cnt<32) begin
                    if(multiplier[cnt] == 1'b1)
                        product <= {(product[63:32] + multiplicand),product[31:0]} >> 1;
                    else
                        product <= product >> 1;
                    cnt <= cnt+1;
                    fin <= 1'b0;
                end
                else 
                    fin <= 1'b1;
        end
    end
endmodule
