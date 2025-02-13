`timescale 1ns / 1ps

module Pipeline_IF(
	input clk_IF,
	input rst_IF,
	input en_IF,
	input [31:0] PC_in_IF,
	input PCSrc,
	
	output [31:0] PC_out_IF
    );
	
	wire [31:0] c;
	wire [31:0] o;
	
	
	MUX2T1_32 MUX2T1_32(
		.I0(c),
		.I1(PC_in_IF),
		.s(PCSrc),
		
		.o(o)
		);
	
	REG32 PC(
		.clk(clk_IF),
		.rst(rst_IF),
		.CE(en_IF),
		.D(o),
		
		.Q(PC_out_IF)
		);
	
	add_32 add_32(
		.a(32'h4),
		.b(PC_out_IF),
		
		.c(c)
		);
	
endmodule
