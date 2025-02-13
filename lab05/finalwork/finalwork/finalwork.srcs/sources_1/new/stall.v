`timescale 1ns / 1ps

module stall(
	input rst_stall,
	input RegWrite_out_IDEX,
	input [4:0] Rd_addr_out_IDEX,
	input RegWrite_out_EXMem,
	input [4:0] Rd_addr_out_EXMem,
	input [4:0] Rs1_addr_ID,
	input [4:0] Rs2_addr_ID,
	input Rs1_used,
	input Rs2_used,
	input Branch_ID,
	input BranchN_ID,
	input [1:0] Jump_ID,
	input Branch_out_IDEX,
	input BranchN_out_IDEX,
	input [1:0] Jump_out_IDEX,
	input Branch_out_EXMem,
	input BranchN_out_EXMem,
	input [1:0] Jump_out_EXMem,
	
	output en_IF,
	output en_IFID,
	output NOP_IFID,
	output NOP_IDEX
    );
	
	
	
	
	
	wire dataHazard, controlHazard;
	
	assign dataHazard = 
		((RegWrite_out_EXMem && Rs1_used) && (Rs1_addr_ID != 5'b00000) && (Rd_addr_out_EXMem == Rs1_addr_ID)) ||
		((RegWrite_out_EXMem && Rs2_used) && (Rs2_addr_ID != 5'b00000) && (Rd_addr_out_EXMem == Rs2_addr_ID)) ||
		((RegWrite_out_IDEX && Rs1_used) && (Rs1_addr_ID != 5'b00000) && (Rd_addr_out_IDEX == Rs1_addr_ID)) ||
		((RegWrite_out_IDEX && Rs2_used) && (Rs2_addr_ID != 5'b00000) && (Rd_addr_out_IDEX == Rs2_addr_ID));
		
	assign controlHazard = 
		Branch_ID || BranchN_ID || Jump_ID[0] || Branch_out_IDEX || BranchN_out_IDEX ||
		Jump_out_IDEX[0] || Branch_out_EXMem || BranchN_out_EXMem || Jump_out_EXMem[0];
		// ???
		
		
	assign en_IF = (~dataHazard)&&(~controlHazard);
	assign en_IFID = (~dataHazard)&&(~controlHazard);
	
	assign NOP_IDEX = dataHazard;
	assign NOP_IFID = controlHazard;
	
	
	
	
endmodule
