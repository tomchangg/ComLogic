`timescale 1ns / 1ps
module alu_test();
    reg [31:0] A, B;
    reg [3:0] ALU_operation;

    wire [31:0] res;

    ALU uut(
        .A(A),
        .B(B),
        .ALU_operation(ALU_operation),
        .res(res)
    );

    initial begin
		A = 32'h80000000;
		B = 32'h00000001;
        ALU_operation = 4'b0111;
        #10;
        ALU_operation = 4'b1001;
	end
endmodule
