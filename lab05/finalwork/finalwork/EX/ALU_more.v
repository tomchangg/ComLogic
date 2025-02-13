`timescale 1ns / 1ps

module ALU_more(
    input [31:0] A,
    input [3:0] ALU_operation,
    input [31:0] B,
    output reg [31:0] res,
    output zero
);
    parameter one = 32'h00000001, zero_0 = 32'h00000000;
    always @ (*)
        case (ALU_operation) 
        4'b0000: res = A & B; //and
        4'b0001: res = A | B; //or
        4'b0010: res = A + B; //add
        4'b1100: res = A ^ B; //xor
        4'b1101: res = A >> B;  //srl
        4'b0110: res = A - B; //sub
        4'b0111: res = ($signed(A) > $signed(B)) ? one : zero_0; //slt
        4'b1111: res = ($signed(A) >> B); //sra
        4'b1110: res = A << B; //sll
        4'b1001: res = (A < B) ? one : zero_0; //sltu
        default: res = 32'hx; 
    endcase
    
    assign zero = (res==0)? 1: 0;
endmodule