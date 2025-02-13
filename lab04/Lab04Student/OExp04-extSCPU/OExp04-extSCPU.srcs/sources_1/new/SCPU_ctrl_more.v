`timescale 1ns / 1ps

module SCPU_ctrl_more(
        input[4:0]OPcode, //Opcode
        input[2:0]Fun3, //Function
        input Fun7, //Function
        input MIO_ready, //CPU Wait
        output reg [2:0]ImmSel, //立即数选择控制
        output reg ALUSrc_B, //源操作数2选择
        output reg [1:0]MemtoReg, //写回数据选择控制
        output reg [1:0]Jump, //jal
        output reg Branch, //beq
        output reg BranchN,
        output reg RegWrite, //寄存器写使能
        output reg MemRW, //存储器读写使能
        output reg [3:0]ALU_Control, //alu控制
        output reg CPU_MIO 
    );

    reg [1:0] ALUop;
    wire [3:0] Fun;
    assign Fun = {Fun3,Fun7};
    
    always @(*) begin
        case(OPcode)
            5'b01100: begin {ALUSrc_B,MemtoReg,RegWrite,MemRW,Branch,BranchN,Jump,ALUop,ImmSel}  = 14'b0_00_1_0_0_0_00_10_000; end //ALU
            5'b00000: begin {ALUSrc_B,MemtoReg,RegWrite,MemRW,Branch,BranchN,Jump,ALUop,ImmSel}  = 14'b1_01_1_0_0_0_00_00_001; end //load
            5'b01000: begin {ALUSrc_B,MemtoReg,RegWrite,MemRW,Branch,BranchN,Jump,ALUop,ImmSel}  = 14'b1_00_0_1_0_0_00_00_010; end //store
            5'b11000: begin 
                    case(Fun3)
                        3'b000: begin {ALUSrc_B,MemtoReg,RegWrite,MemRW,Branch,BranchN,Jump,ALUop,ImmSel}  = 14'b0_00_0_0_1_0_00_01_011; end // beq
                        3'b001: begin {ALUSrc_B,MemtoReg,RegWrite,MemRW,Branch,BranchN,Jump,ALUop,ImmSel}  = 14'b0_00_0_0_0_1_00_01_011; end // bne
                    endcase 
                end
            5'b11011: begin {ALUSrc_B,MemtoReg,RegWrite,MemRW,Branch,BranchN,Jump,ALUop,ImmSel}  = 14'b0_10_1_0_0_0_01_00_100; end //jump
            5'b00100: begin {ALUSrc_B,MemtoReg,RegWrite,MemRW,Branch,BranchN,Jump,ALUop,ImmSel}  = 14'b1_00_1_0_0_0_00_11_001; end //ALU(addi;;;;)
            5'b11001: begin {ALUSrc_B,MemtoReg,RegWrite,MemRW,Branch,BranchN,Jump,ALUop,ImmSel}  = 14'b1_10_1_0_0_0_10_00_001; end //jarl
            5'b01101: begin {ALUSrc_B,MemtoReg,RegWrite,MemRW,Branch,BranchN,Jump,ALUop,ImmSel}  = 14'b0_11_1_0_0_0_00_00_000; end //lui
            default: begin  {ALUSrc_B,MemtoReg,RegWrite,MemRW,Branch,BranchN,Jump,ALUop,ImmSel}  = 14'h0; end
        endcase
    end

    always @(*) begin
        case(ALUop)
        2'b00: ALU_Control = 4'b0010 ; 
        2'b01: ALU_Control = 4'b0110 ; 
        2'b10: 
            case(Fun)
            4'b0000: ALU_Control = 4'b0010 ; //add
            4'b0001: ALU_Control = 4'b0110 ; //sub
            4'b1110: ALU_Control = 4'b0000 ; //and
            4'b1100: ALU_Control = 4'b0001 ; //or
            4'b0100: ALU_Control = 4'b0111 ; //slt
            4'b1010: ALU_Control = 4'b0101 ; //srl
            4'b1000: ALU_Control = 4'b0011 ; //xor
            4'b0110: ALU_Control = 4'b1010 ; //sltu
            4'b0010: ALU_Control = 4'b1001 ; //sll
            4'b1011: ALU_Control = 4'b1000 ; //sra
            default: ALU_Control = 3'bx;  
            endcase
        2'b11:
            case(Fun3)
            3'b000: ALU_Control = 3'b010 ;//addi
            3'b010: ALU_Control = 3'b111 ; //slti
            3'b100: ALU_Control = 3'b011 ; //xori
            3'b110: ALU_Control = 3'b001 ; //ori
            3'b111: ALU_Control = 3'b000 ; //andi
            3'b101: 
                if(Fun7)
                        ALU_Control = 4'b1000 ; //srai
                    else
                        ALU_Control = 4'b0101 ; //srli
            3'b011: ALU_Control = 4'b1010 ; //sltiu
            3'b001: ALU_Control = 4'b1001 ; //slli
            default: ALU_Control = 4'bx ; 
            endcase
        endcase
    end
endmodule
