`timescale 1ns / 1ps

module SCPU_ctrl_more(
	input[4:0] OPcode,
	input[2:0] Fun3,
	input Fun7,
	input MIO_ready,
	
	output reg[2:0] ImmSel,
	output reg ALUSrc_B,
	output reg[1:0] MemtoReg,
	output reg[1:0] Jump,
	output reg Branch,
	output reg BranchN,
	output reg RegWrite,
	output reg MemRW,
	output reg[3:0] ALU_Control,
	output reg CPU_MIO,
	
	output reg Rs1_used,
	output reg Rs2_used
	);
	
	reg [1:0] ALUop;
	wire [3:0] Fun;

	always @* begin
		case(OPcode)
		5'b01100: begin {ALUSrc_B,MemtoReg,RegWrite,MemRW,Branch,BranchN,Jump,ALUop,ImmSel}  = 14'b0_00_1_0_0_0_00_10_000; end //ALU
		5'b00000: begin {ALUSrc_B,MemtoReg,RegWrite,MemRW,Branch,BranchN,Jump,ALUop,ImmSel}  = 14'b1_01_1_0_0_0_00_00_001; end //load
		5'b01000: begin {ALUSrc_B,MemtoReg,RegWrite,MemRW,Branch,BranchN,Jump,ALUop,ImmSel}  = 14'b1_00_0_1_0_0_00_00_010; end //store
		5'b11000: begin 
			case(Fun3)
			3'b000: begin {ALUSrc_B,MemtoReg,RegWrite,MemRW,Branch,BranchN,Jump,ALUop,ImmSel}  = 14'b0_00_0_0_1_0_00_01_011; end //beq
			3'b001: begin {ALUSrc_B,MemtoReg,RegWrite,MemRW,Branch,BranchN,Jump,ALUop,ImmSel}  = 14'b0_00_0_0_0_1_00_01_011; end //bne
			endcase
			end
		5'b11011: begin {ALUSrc_B,MemtoReg,RegWrite,MemRW,Branch,BranchN,Jump,ALUop,ImmSel}  = 14'b1_10_1_0_0_0_01_00_101; end //jump
		5'b00100: begin {ALUSrc_B,MemtoReg,RegWrite,MemRW,Branch,BranchN,Jump,ALUop,ImmSel}  = 14'b1_00_1_0_0_0_00_11_001; end //ALU(addi;;;;)
		5'b11001: begin {ALUSrc_B,MemtoReg,RegWrite,MemRW,Branch,BranchN,Jump,ALUop,ImmSel}  = 14'b1_10_1_0_0_0_10_00_001; end //jarl
		5'b01101: begin {ALUSrc_B,MemtoReg,RegWrite,MemRW,Branch,BranchN,Jump,ALUop,ImmSel}  = 14'b0_11_1_0_0_0_00_00_000; end //lui
		default: begin  {ALUSrc_B,MemtoReg,RegWrite,MemRW,Branch,BranchN,Jump,ALUop,ImmSel}  = 14'h0; end
		endcase
	end
	
	always @* begin
		case(OPcode)
			5'b01100: begin Rs1_used = 1'b1; Rs2_used = 1'b1; end
			5'b00000: begin Rs1_used = 1'b1; Rs2_used = 1'b0; end
			5'b01000: begin Rs1_used = 1'b1; Rs2_used = 1'b1; end
			5'b11000: begin Rs1_used = 1'b1; Rs2_used = 1'b1; end
			5'b11011: begin Rs1_used = 1'b0; Rs2_used = 1'b0; end
			5'b00100: begin Rs1_used = 1'b1; Rs2_used = 1'b0; end
			default: begin Rs1_used = 1'b0; Rs2_used = 1'b0; end
		endcase
	end


assign Fun = {Fun3,Fun7};

	always @* begin
		case(ALUop)
		2'b00: ALU_Control = 4'b0010 ; //add
		2'b01: ALU_Control = 4'b0110 ; //sub
		2'b10: 
			case(Fun)
			4'b0000: ALU_Control = 4'b0010 ; //add
			4'b0001: ALU_Control = 4'b0110 ; //sub
			4'b1110: ALU_Control = 4'b0000 ; //and
			4'b1100: ALU_Control = 4'b0001 ; //or
			4'b0100: ALU_Control = 4'b0111 ; //slt
			4'b1010: ALU_Control = 4'b1101 ; //srl
			4'b1000: ALU_Control = 4'b1100 ; //xor
			4'b0110: ALU_Control = 4'b1001 ; //sltu
			4'b0010: ALU_Control = 4'b1110 ; //sll
			4'b1011: ALU_Control = 4'b1111 ; //sra
			default: ALU_Control = 4'bx;  //nor(no this kind)
			endcase
		2'b11:
			case(Fun3)
			3'b000: ALU_Control = 4'b0010 ; //addi
			3'b010: ALU_Control = 4'b0111 ; //slti
			3'b100: ALU_Control = 4'b1100 ; //xori
			3'b110: ALU_Control = 4'b0001 ; //ori
			3'b111: ALU_Control = 4'b0000 ; //andi
			3'b101: 
				if(Fun7)
					ALU_Control = 4'b1111 ; //srai
				else
					ALU_Control = 4'b1101 ; //srli
			3'b011: ALU_Control = 4'b1001 ; //sltiu
			3'b001: ALU_Control = 4'b1110 ; //slli
			default: ALU_Control = 4'bx ;  //nor(no this kind)
			endcase
		endcase
	end
	
endmodule