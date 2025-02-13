`timescale 1ns / 1ps
module ALU_test(
    input [31:0] A,
    input [3:0] ALU_operation,
    input [31:0] B,
    output[31:0] res
);
    ALU uut(
        .A(A),
        .ALU_operation(ALU_operation),
        .B(B),
        .res(res)
    );
endmodule
