`timescale 1ns / 1ps
module Datapath_tb();
    reg clk;
    reg rst;
    reg[31:0] inst_field;
    reg[31:0] Data_in;
    reg[2:0] ALU_operation;
    reg[1:0] ImmSel;
    reg[1:0] MemtoReg;
    reg ALUSrc_B;
    reg Jump;
    reg Branch;
    reg RegWrite;

    wire[31:0] PC_out;
    wire[31:0] Data_out;
    wire[31:0] ALU_out;

    DataPath U1(
        .clk(clk),
        .rst(rst),
        .inst_field(inst_field),
        .Data_in(Data_in),
        .ImmSel(ImmSel),
        .MemtoReg(MemtoReg),
        .ALU_operation(ALU_operation),
        .ALUSrc_B(ALUSrc_B),
        .Jump(Jump),
        .Branch(Branch),
        .RegWrite(RegWrite),
        .PC_out(PC_out),
        .Data_out(Data_out),
        .ALU_out(ALU_out)
    );

    always #5 clk = ~clk;
    initial begin 

     rst = 1;
     clk = 0;
     Branch = 0;
     Jump = 0;
     ALUSrc_B = 0;
     ALU_operation = 3'b010;
     MemtoReg = 2'b00;
     ImmSel = 2'b00;
     Data_in = 32'b00000000000000000000000000000000;
     RegWrite = 0; #4
     rst = 0;
     //I addi x3,x1,100
     inst_field = 32'b000001100100_00001_000_00011_0010011;
     ALUSrc_B = 1;
     ALU_operation = 3'b010;
     ImmSel = 2'b00;
     RegWrite = 1;
     MemtoReg = 2'b00;
     #10
     //R add x1,x2,x3
     inst_field = 32'b0000000_00011_00010_000_00001_0110011;
     ALU_operation = 3'b010;
     RegWrite = 1;
     ALUSrc_B = 0;
     MemtoReg = 2'b00;
     #10
     //I addi x2,x2,2
     inst_field = 32'b000000000010_00010_000_00010_0010011;
     ALUSrc_B = 1;
     ALU_operation = 3'b010;
     ImmSel = 2'b00;
     RegWrite = 1;
     MemtoReg = 2'b00;
     #10
     //R sub x4 x3 x2
     inst_field = 32'b0100000_00010_00011_000_00100_0110011;
     ALUSrc_B = 0;
     ALU_operation = 3'b110;
     RegWrite = 1;
     MemtoReg = 2'b00;
     #10
     //R srl x5 x1 x2
     inst_field = 32'b0000000_00010_00001_101_00101_0110011;
     ALUSrc_B = 0;
     ALU_operation = 3'b101;
     RegWrite = 1;
     MemtoReg = 2'b00;
     #10
     //I xori x6,x4,87
     inst_field = 32'b000001010111_00100_100_00110_0010011;
     ALUSrc_B = 1;
     ALU_operation = 3'b011;
     ImmSel = 2'b00;
     RegWrite = 1;
     MemtoReg = 2'b00;
     #10
     //I lw x7,4(x6)
     inst_field = 32'b000000000100_00110_010_00111_0000011;
     ALUSrc_B = 1;
     ALU_operation = 3'b010;
     ImmSel = 2'b00;
     RegWrite = 1;
     Data_in = 32'b1010_1010_1010_1010_1010_1010_1010_1010;
     MemtoReg = 2'b01;
     #10
     //S sw x7,4(x6)
     inst_field = 32'b0000000_00111_00110_010_00100_0100011;
     ALUSrc_B =1;
     ALU_operation = 3'b010;
     ImmSel = 2'b01;
     RegWrite = 0;
     MemtoReg = 2'b00;
     #10
     //B beq x1,x3,100
     inst_field = 32'b0000011_00011_00001_000_00100_1100111;
     Branch = 1;
     ALUSrc_B = 0;
     ALU_operation = 3'b110;
     ImmSel = 2'b10;
     #10
     // J jal x8 164
     inst_field = 32'b0000101_00100_00000_000_01000_1101111;
     Branch = 0;
     Jump = 1;
     RegWrite = 1;
     MemtoReg = 2'b10;
     ImmSel = 2'b11;
     #10
     $finish;
    end
endmodule
