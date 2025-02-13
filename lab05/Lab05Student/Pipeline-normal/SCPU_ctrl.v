`timescale 1ns / 1ps

module SCPU_ctrl(
        input[4:0]OPcode, //Opcode------inst[6:2]
        input[2:0]Fun3, //Function-----inst[14:12]
        input Fun7, //Function-----inst[30]
        input MIO_ready, //CPU Wait
        output reg [1:0]ImmSel, //立即数选择控制
        output reg ALUSrc_B, //源操作数2选择
        output reg [1:0]MemtoReg, //写回数据选择控制
        output reg Jump, //jal
        output reg Branch, //beq
        output reg RegWrite, //寄存器写使能
        output reg MemRW, //存储器读写使能
        output reg [2:0]ALU_Control, //alu控制
        output reg CPU_MIO 
    );

    reg [1:0] ALUop;
    wire [3:0] Fun;
    reg [10:0]CPU_ctrl_signals;
    
    always @(*) begin
        case(OPcode)
            5'b01100: begin {ALUSrc_B,MemtoReg,RegWrite,MemRW,Branch,Jump,ALUop,ImmSel} = 11'b0_00_1_0_0_0_10_00; end //ALU    - *
            5'b00000: begin {ALUSrc_B,MemtoReg,RegWrite,MemRW,Branch,Jump,ALUop,ImmSel} = 11'b1_01_1_0_0_0_00_00; end //load   - I
            5'b01000: begin {ALUSrc_B,MemtoReg,RegWrite,MemRW,Branch,Jump,ALUop,ImmSel} = 11'b1_00_0_1_0_0_00_01; end //store  - S
            5'b11000: begin 
                case(Fun3) 
                    3'b000: begin {ALUSrc_B,MemtoReg,RegWrite,MemRW,Branch,Jump,ALUop,ImmSel} = 11'b0_00_0_0_1_0_01_10; end //beq  - B
                    3'b001: begin {ALUSrc_B,MemtoReg,RegWrite,MemRW,Branch,Jump,ALUop,ImmSel} = 11'b0_00_0_0_1_0_01_11; end //bne  - B
                endcase
            end
            5'b11011: begin {ALUSrc_B,MemtoReg,RegWrite,MemRW,Branch,Jump,ALUop,ImmSel} = 11'b1_10_1_0_0_1_00_11; end //jump - J
            5'b00100: begin {ALUSrc_B,MemtoReg,RegWrite,MemRW,Branch,Jump,ALUop,ImmSel} = 11'b1_00_1_0_0_0_11_00; end //ALU(addi) - I
            default: begin  {ALUSrc_B,MemtoReg,RegWrite,MemRW,Branch,Jump,ALUop,ImmSel} = 11'b00000000000; end
        endcase
    end

    assign Fun = {Fun3,Fun7};

    always @(*) begin
        case(ALUop)
        2'b00: ALU_Control = 3'b010 ; //add
        2'b01: ALU_Control = 4'b110 ; //sub
        2'b10: 
            case(Fun)
            4'b0000: ALU_Control = 3'b010 ; //add
            4'b0001: ALU_Control = 3'b110 ; //sub
            4'b1110: ALU_Control = 3'b000 ; //and
            4'b1100: ALU_Control = 3'b001 ; //or
            4'b0100: ALU_Control = 3'b111 ; //slt
            4'b1010: ALU_Control = 3'b101 ; //srl
            4'b1000: ALU_Control = 3'b011 ; //xor
            default: ALU_Control = 3'bx;  
            endcase
        2'b11:
            case(Fun3)
            3'b000: ALU_Control = 3'b010 ;//addi
            3'b010: ALU_Control = 3'b111 ; //slti
            3'b100: ALU_Control = 3'b011 ; //xori
            3'b110: ALU_Control = 3'b001 ; //ori
            3'b111: ALU_Control = 3'b000 ; //andi
            3'b101: ALU_Control = 3'b101 ; //srli
            default: ALU_Control = 3'bx ; 
        endcase
    endcase
    end
endmodule
