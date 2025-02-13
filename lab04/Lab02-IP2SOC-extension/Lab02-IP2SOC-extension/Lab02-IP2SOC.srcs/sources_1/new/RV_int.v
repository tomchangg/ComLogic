`timescale 1ns / 1ps

module RV_int(
	input wire clk,
	input wire reset,
	input wire INT,
	input wire ecall,
	input wire mret,
	input wire ill_instr,
	input wire [31:0] pc_next,
	output reg [31:0] pc
    );
	
	reg [31:0] MEPC;
	
	always@(posedge clk or posedge reset) begin
		if(reset) begin
			MEPC <= 32'h00000000;
		end
		else if (INT | ecall | ill_instr) begin
			MEPC <= pc_next;
		end
	end
	
	always @ (*) begin
		if(reset) begin
			pc = 32'h00000000;
		end
		else if(INT) begin
			pc = 32'h0000000c;
		end
		else if(ecall) begin
			pc = 32'h00000008;
		end
		else if(ill_instr) begin
			pc = 32'h00000004;
		end
		else if (mret) begin
			pc = MEPC;
		end
		else begin
			pc = pc_next;
		end
	end
	
endmodule
