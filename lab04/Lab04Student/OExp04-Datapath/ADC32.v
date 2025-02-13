`timescale 1ns / 1ps
module ADC32(
        input [31:0] A, 
		input [31:0] B, 
		input C0,		
		output [32:0] S
    );

    wire [31:0] B_m;
    assign B_m = C0 ? ~B : B;
    assign S = {1'b0, A} + {1'b0, B_m} + C0;

endmodule