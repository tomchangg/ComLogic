`timescale 1ns / 1ps

module Pipeline_IF(
    input clk_IF,
    input rst_IF,
    input en_IF,
    input [31:0]PC_in_IF,
    input PCSrc,
    output [31:0]PC_out_IF
    );

    wire [31:0] U0_out , PC_in;

    MUX2T1_32 U0(
        .s(PCSrc),
        .I0(PC_in),
        .I1(PC_in_IF),
        .o(U0_out)
    );

    REG32 PC(
        .clk(clk_IF),
        .rst(rst_IF),
        .CE(en_IF),
        .D(U0_out),
        .Q(PC_out_IF)
    );

    add32 add(
        .a(PC_out_IF),
        .b(32'h4),
        .c(PC_in)
    );
endmodule
