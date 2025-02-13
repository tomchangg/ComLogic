`timescale 1ns / 1ps

module SCPU_tb();
    reg[4:0] OPcode;
    reg MIO_ready;
    reg [2:0]Fun3;
    reg Fun7;
    reg Fun;
    wire [1:0]ImmSel;
    wire ALUSrc_B;
    wire Jump;
    wire [1:0] MemtoReg;
    wire Branch;
    wire RegWrite;
    wire MemRW;
    wire [2:0]ALU_Control;
    wire CPU_MIO;


    SCPU_ctrl U1(
        .OPcode(OPcode),
        .Fun3(Fun3),
        .Fun7(Fun7),
        .MIO_ready(MIO_ready),
        .ImmSel(ImmSel),
        .ALUSrc_B(ALUSrc_B),
        .MemtoReg(MemtoReg),
        .Jump(Jump),
        .Branch(Branch),
        .RegWrite(RegWrite),
        .MemRW(MemRW),
        .ALU_Control(ALU_Control),
        .CPU_MIO(CPU_MIO)
        );

    initial begin
        OPcode = 0;
        Fun = 0;
        Fun3 = 0;
        Fun7 = 0;
        MIO_ready = 0; #40;        // Wait 40 ns for global reset to finish

        OPcode = 5'b01100;         //ALU指令,检查 ALUop=2'b10; RegWrite=1
        Fun3 = 3'b000; Fun7 = 1'b0;//add,检查ALU_Control=3'b010
        #20;
        Fun3 = 3'b000; Fun7 = 1'b1;//sub,检查ALU_Control=3'b110
        #20;
        Fun3 = 3'b111; Fun7 = 1'b0;//and,检查ALU_Control=3'b000
        #20;
        Fun3 = 3'b110; Fun7 = 1'b0;//or,检查ALU_Control=3'b001
        #20;
        Fun3 = 3'b010; Fun7 = 1'b0;//slt,检查ALU_Control=3'b111
        #20;
        Fun3 = 3'b101; Fun7 = 1'b0;//srl,检查ALU_Control=3'b101
        #20;
        Fun3 = 3'b100; Fun7 = 1'b0;//xor,检查ALU_Control=3'b011
        #10;
        OPcode = 5'b00000; #20//load指令,检查 ALUop=2'b00, #20; // ALUSrc_B=1, MemtoReg=1, RegWrite=1
        OPcode = 5'b01000; #20; //store指令,检查ALUop=2'b00, MemRW=1, ALUSrc_B=1
        OPcode = 5'b11000; #20//beq指令,检查 ALUop=2'b01, Branch=1 #20;
        OPcode = 5'b11011; #40//jump指令,检查 Jump=1
        OPcode = 5'b00100; //I指令,检查 ALUop=2'b11; RegWrite=1 #20;
        Fun3 = 3'b000; Fun7 = 1'b0;//addi,检查ALU_Control=3'b010
        #20;
        Fun3 = 3'b000; Fun7 = 1'b1;//subi,检查ALU_Control=3'b110
        #20;
        Fun3 = 3'b111; Fun7 = 1'b0;//andi,检查ALU_Control=3'b000
        #20;
        Fun3 = 3'b110; Fun7 = 1'b0;//ori,检查ALU_Control=3'b001
        #20;
        Fun3 = 3'b010; Fun7 = 1'b0;//slti,检查ALU_Control=3'b111
        #20;
        Fun3 = 3'b101; Fun7 = 1'b0;//srli,检查ALU_Control=3'b101
        #20;
        Fun3 = 3'b100; Fun7 = 1'b0;//xori,检查ALU_Control=3'b011
        #20;
        OPcode = 5'h1f; //间隔
        Fun3 = 3'b000; Fun7 = 1'b0;//间隔
    end
endmodule
