`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/05/16 03:45:13
// Design Name: 
// Module Name: SCPU_ctrl
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module SCPU_ctrl(
    input [4:0]OPcode, //Opcode------inst[6:2]
    input [2:0]Fun3, //Function-----inst[14:12]
    input Fun7, //Function-----inst[30]
    input MIO_ready, //CPU Wait
    output reg [1:0]ImmSel, //立即数选择控制
    output reg ALUSrc_B, //源操作数2选择
    output reg [1:0]MemtoReg, //写回数据选择控制
    output reg Jump, //jal
    output reg Branch, //beq
    output reg BranchN, //bne
    output reg RegWrite, //寄存器写使能
    output reg MemRW, //存储器读写使能
    output reg [2:0]ALU_Control, //alu控制
    output reg CPU_MIO, //not use
    
    output reg Rs1_used,
    output reg Rs2_used
    ); 
    
    wire [3:0] Fun;
    reg [1:0] ALUop;
    
    always@(*) begin
        case(OPcode)
            5'b01100: begin ALUop = 2'b10; Branch = 0; BranchN = 0; Jump = 0; ImmSel = 2'b00; ALUSrc_B = 0; MemRW = 0; RegWrite = 1; MemtoReg = 2'b00;
                Rs1_used = 1'b1; Rs2_used = 1'b1; end //ALU
            5'b00000: begin ALUop = 2'b00; Branch = 0; BranchN = 0; Jump = 0; ImmSel = 2'b00; ALUSrc_B = 1; MemRW = 0; RegWrite = 1; MemtoReg = 2'b01;
                 Rs1_used = 1'b1; Rs2_used = 1'b0; end //load
            5'b01000: begin ALUop = 2'b00; Branch = 0; BranchN = 0; Jump = 0; ImmSel = 2'b01; ALUSrc_B = 1; MemRW = 1; RegWrite = 0; MemtoReg = 2'b00;
                 Rs1_used = 1'b1; Rs2_used = 1'b1; end //store
            5'b11000: begin
                case(Fun3)
                    3'b000:
                        begin 
                        ALUop = 2'b01; Branch = 1; BranchN = 0; Jump = 0; ImmSel = 2'b10; ALUSrc_B = 0; MemRW = 0; RegWrite = 0; MemtoReg = 2'b00; 
                        end //beq
                    3'b001:
                        begin 
                        ALUop = 2'b01; Branch = 0; BranchN = 1; Jump = 0; ImmSel = 2'b10; ALUSrc_B = 0; MemRW = 0; RegWrite = 0; MemtoReg = 2'b00; 
                        end //bne
                    default:begin
                        ALUop = 2'b00; Branch = 0; BranchN = 0; Jump = 0; ImmSel = 2'b00; ALUSrc_B = 0; MemRW = 0; RegWrite = 0; MemtoReg = 2'b00;
                        end
                endcase
                Rs1_used = 1'b1; Rs2_used = 1'b1;
            end
            5'b11011: begin ALUop = 2'b00; Branch = 0; BranchN = 0; Jump = 1; ImmSel = 2'b11; ALUSrc_B = 1; MemRW = 0; RegWrite = 0; MemtoReg = 2'b10;
                Rs1_used = 1'b0; Rs2_used = 1'b0; end //jump
            5'b00100: begin ALUop = 2'b11; Branch = 0; BranchN = 0; Jump = 0; ImmSel = 2'b00; ALUSrc_B = 1; MemRW = 0; RegWrite = 1; MemtoReg = 2'b00;
                Rs1_used = 1'b1; Rs2_used = 1'b0; end //ALUi
            default: begin ALUop = 2'b00; Branch = 0; BranchN = 0; Jump = 0; ImmSel = 2'b00; ALUSrc_B = 0; MemRW = 0; RegWrite = 0; MemtoReg = 2'b00;
                Rs1_used = 1'b0; Rs2_used = 1'b0; end
        endcase
    end
    
    assign Fun = {Fun3,Fun7};
    always @* begin
        case(ALUop)
        2'b00: ALU_Control = 3'b010 ; //add计算地址 load store
        2'b01: ALU_Control = 3'b110 ; //sub比较条件 beq
        2'b10: 
            case(Fun)
                4'b0000: ALU_Control = 3'b010 ; //add
                4'b0001: ALU_Control = 3'b110 ; //sub
                4'b1110: ALU_Control = 3'b000 ; //and
                4'b1100: ALU_Control = 3'b001 ; //or
                4'b0100: ALU_Control = 3'b111 ; //slt
                4'b1010: ALU_Control = 3'b101 ; //srl
                4'b1000: ALU_Control = 3'b011 ; //xor
                default: ALU_Control=3'b000;
            endcase
        2'b11: 
            case(Fun3)
                3'b000: ALU_Control = 3'b010; //addi
                3'b010: ALU_Control = 3'b111; //slti
                3'b100: ALU_Control = 3'b011; //xori
                3'b110: ALU_Control = 3'b001; //ori
                3'b111: ALU_Control = 3'b000; //andi
                3'b101: ALU_Control = 3'b101; //srli
                default: ALU_Control=3'b000;
            endcase
        endcase
    end
    
endmodule
