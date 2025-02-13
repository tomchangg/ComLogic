`timescale 1ns / 1ps

module SOC_int(
    input clk,
    input rst,
    input [31:0]Data_in,
    input [31:0]inst_in,
    input MIO_ready,
    input INT0,
    
    output MemRW,
    output CPU_MIO,
    output [31:0]Data_out,
    output [31:0]PC_out,
    output [31:0]Addr_out,
    output [1023:0] all_regs_data,
    output [31:0]mepc
    );
    // wire[4:0] opcode;   assign opcode = inst_in[6:2];
    // wire[2:0] Fun3;     assign Fun3 = inst_in[14:12];
    // wire[2:0] funecall; assign funecall = inst_in[22:20];
    // wire[1:0] funmret;  assign funmret = inst_in[29:28];
    wire [3:0]ALU_Control;
    wire [2:0]ImmSel;
    wire [1:0]MemtoReg,Jump;
    wire Branch, BranchN, RegWrite, ALUSrc_B;
    wire ecall,mret,ill_instr;



    SCPU_ctrl_int U1(
        .OPcode(inst_in[6:2]),
        .Fun3(inst_in[14:12]),
        .Fun7(inst_in[30]),
        .MIO_ready(MIO_ready),
		
		.Fun_ecall(inst_in[22:20]),
		.Fun_mret(inst_in[29:28]),
        .ImmSel(ImmSel),
        .ALUSrc_B(ALUSrc_B),
        .MemtoReg(MemtoReg),
        .Jump(Jump),
        .Branch(Branch),
        .BranchN(BranchN),
        .RegWrite(RegWrite),
        .MemRW(MemRW),
        .ALU_Control(ALU_Control),
        .CPU_MIO(CPU_MIO),
        .ecall(ecall),
        .mret(mret),
        .ill_instr(ill_instr)
    );

    Datapath_int U2(
        .ALUSrc_B(ALUSrc_B),
        .ALU_operation(ALU_Control),
        .Branch(Branch),
        .BranchN(BranchN),
        .Data_in(Data_in),
        .ImmSel(ImmSel),
        .Jump(Jump),
        .MemtoReg(MemtoReg),
        .RegWrite(RegWrite),
        .clk(clk),
        .inst_field(inst_in),
        .rst(rst),
        .ALU_out(Addr_out),
        .Data_out(Data_out),
        .PC_out(PC_out),
        .all_regs_data(all_regs_data),
        .INT0(INT0),
        .ecall(ecall),
        .ill_instr(ill_instr),
        .mret(mret),
        .mepc(mepc)
    );
endmodule
