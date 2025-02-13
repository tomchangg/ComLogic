`timescale 1ns / 1ps
module ALU(
    input [31:0] A,
    input [2:0] ALU_operation,
    input [31:0] B,
    output reg [31:0] res,
    output zero
    );

    wire [32:0] addc;
    parameter one = 32'h00000001 , zero_0 = 32'h00000000;
    always @ (*) 
        case (ALU_operation) 
            3'b000: res = A & B; 
            3'b001: res = A | B;
            3'b010: res = A + B;
            3'b011: res = A ^ B;
            3'b101: res = A >> B[4:0];
            3'b110: res = A - B;
            3'b111: res = ($signed(A) < $signed(B)) ? one : zero_0; //slt
        endcase
    assign zero = (res == 32'h0);
endmodule