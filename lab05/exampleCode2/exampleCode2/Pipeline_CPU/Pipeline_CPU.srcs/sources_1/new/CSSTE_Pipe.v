`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/06/04 21:35:07
// Design Name: 
// Module Name: CSSTE_Pipe
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


module CSSTE_Pipe(
    input clk_100mhz,
    input RSTN,
    input [3:0] BTN_y,
    input [15:0] SW,
    output [3:0] Blue,
    output [3:0] Green,
    output [3:0] Red,
    output HSYNC,
    output VSYNC,
    output [15:0] LED_out,
    output [7:0] AN,
    output [7:0] segment
    );
    
    wire [3:0] BTN_OK;
    wire [15:0] SW_OK;
    wire rst;
    wire Clk_CPU;
    wire [31:0] clkdiv;
    wire [31:0] Addr_out;
    wire [31:0] Data_out;
    wire [31:0] PC_out;
    wire MemRW_Mem, MemRW_EX;
    wire [31:0] Inst_in;
    wire [31:0] Data_in;
    wire [9:0] ram_addr;
    wire [31:0] ram_data_in;
    wire [31:0] RAM_B_0_douta;
    wire [31:0] U4_data_ram_we;
    wire U4_GPIOe0000000_we;
    wire U4_GPIOf0000000_we;
    wire [31:0] U4_Peripheral_in;
    wire U10_counter0_OUT;
    wire U10_counter1_OUT;
    wire U10_counter2_OUT;
    wire [31:0] U10_counter_out;
    wire U4_counter_we;
    wire [15:0] U7_LED_out;
    
    wire [31:0] Multi_8CH32_0_Disp_num;
    wire [7:0] Multi_8CH32_0_LE_out;
    wire [7:0] Multi_8CH32_0_point_out;
    wire [1:0] U7_counter_set;
    
    wire [31:0] x0, x1, x2, x3, x4, x5, x6, x7, x8, x9, x10, x11, x12, x13, x14, x15, x16, x17, x18, x19, x20, x21, x22, x23, x24, x25, x26, x27, x28, x29, x30, x31;
    wire [4:0] rs1, rs2, rd;
    wire [31:0] reg_i_data, rs1_val, rs2_val, imm, a_val, b_val, alu_res;
    
    wire [31:0] PC_out_ID, inst_ID, Data_out_WB, PC_out_EX, PC_Ex;
    wire [4:0]IdEx_rs1,IdEx_rs2, IdEx_rd;
    wire [31:0]IdEx_rs1_val, IdEx_rs2_val, IdEx_imm, IdEx_inst;
    wire [3:0]IdEx_alu_ctrl;
    wire IdEx_reg_wen, IdEx_is_branch, IdEx_is_jal;   
    
    Pipeline_CPU U1(
        .clk(Clk_CPU),
        .rst(rst),
        .inst_IF(Inst_in),
        .Data_in(Data_in),
        .PC_out_IF(PC_out),
        .PC_out_ID(PC_out_ID),
        .inst_ID(inst_ID),
        .PC_out_EX(PC_out_EX),
        .MemRW_EX(MemRW_EX),
        .MemRW_Mem(MemRW_Mem),
        .Data_out(Data_out),
        .Addr_out(Addr_out),        
        .Data_out_WB(Data_out_WB),
        
        .x0(x0),
        .x1(x1),
        .x2(x2),
        .x3(x3),
        .x4(x4),
        .x5(x5),
        .x6(x6),
        .x7(x7),
        .x8(x8),
        .x9(x9),
        .x10(x10),
        .x11(x11),
        .x12(x12),
        .x13(x13),
        .x14(x14),
        .x15(x15),
        .x16(x16),
        .x17(x17),
        .x18(x18),
        .x19(x19),
        .x20(x20),
        .x21(x21),
        .x22(x22),
        .x23(x23),
        .x24(x24),
        .x25(x25),
        .x26(x26),
        .x27(x27),
        .x28(x28),
        .x29(x29),
        .x30(x30),
        .x31(x31),
        .IdEx_rd(IdEx_rd),
        .IdEx_rs1(IdEx_rs1),
        .IdEx_rs2(IdEx_rs2),
        .IdEx_rs1_val(IdEx_rs1_val),
        .IdEx_rs2_val(IdEx_rs2_val),
        .IdEx_alu_ctrl(IdEx_alu_ctrl),
        .IdEx_reg_wen(IdEx_reg_wen),
        .IdEx_imm(IdEx_imm),
        .IdEx_is_branch(IdEx_is_branch),
        .IdEx_is_jal(IdEx_is_jal),
        .IdEx_inst(IdEx_inst),
        .PC_Ex(PC_Ex)
        );
    ROM_D_0 U2(
        .a(PC_out[11:2]),
        .spo(Inst_in)
        );
    RAM_B U3(
        .addra(ram_addr),
        .clka(~clk_100mhz),
        .dina(ram_data_in),
        .douta(RAM_B_0_douta),
        .wea(U4_data_ram_we)
        );
    MIO_BUS U4(
        .BTN(BTN_OK),
        .Cpu_data2bus(Data_out),
        .Cpu_data4bus(Data_in),
        .GPIOe0000000_we(U4_GPIOe0000000_we),
        .GPIOf0000000_we(U4_GPIOf0000000_we),
        .Peripheral_in(U4_Peripheral_in),
        .SW(SW_OK),
        .addr_bus(Addr_out),
        .clk(clk_100mhz),
        .counter0_out(U10_counter0_OUT),
        .counter1_out(U10_counter1_OUT),
        .counter2_out(U10_counter2_OUT),
        .counter_out(U10_counter_out),
        .counter_we(U4_counter_we),
        .data_ram_we(U4_data_ram_we),
        .led_out(U7_LED_out),
        .mem_w(MemRW_Mem),
        .ram_addr(ram_addr),
        .ram_data_in(ram_data_in),
        .ram_data_out(RAM_B_0_douta),
        .rst(rst)
        );    
    Multi_8CH32 U5(
        .Data0(U4_Peripheral_in),
        .Disp_num(Multi_8CH32_0_Disp_num),
        .EN(U4_GPIOe0000000_we),
        .LES(64'b0),
        .LE_out(Multi_8CH32_0_LE_out),
        .Test(SW_OK[7:5]),
        .clk(~Clk_CPU),
        .data1({2'b0,PC_out[31:2]}),
        .data2(Inst_in),
        .data3(U10_counter_out),
        .data4(Addr_out),
        .data5(Data_out),
        .data6(Data_in),
        .data7(PC_out),
        .point_in({clkdiv[31:0],clkdiv[31:0]}),
        .point_out(Multi_8CH32_0_point_out),
        .rst(rst)
        );
    Seg7_Dev_0 U6(
        .disp_num(Multi_8CH32_0_Disp_num),
        .point(Multi_8CH32_0_point_out), 
        .les(Multi_8CH32_0_LE_out),
        .scan({clkdiv[18], clkdiv[17], clkdiv[16]}), 
        .AN(AN),             
        .segment(segment)   
        );    
    SPIO U7(
        .EN(U4_GPIOf0000000_we),
        .LED_out(U7_LED_out),
        .P_Data(U4_Peripheral_in),
        .Start(clkdiv[20]),
        .clk(~Clk_CPU),
        .counter_set(U7_counter_set),
        .led_clk(),
        .led_clrn(),
        .led_sout(),
        .rst(rst),
        .LED_PEN(),
        .GPIOf0()
        );
    clk_div U8(
        .Clk_CPU(Clk_CPU),
        .STEP(SW_OK[10]),
        .SW2(SW_OK[2]),
        .SW8(SW_OK[8]),
        .clk(clk_100mhz),
        .clkdiv(clkdiv),
        .rst(rst)
        );
    SAnti_jitter U9(
        .BTN_OK(BTN_OK),
        .Key_y(BTN_y),
        .RSTN(RSTN),
        .SW(SW),
        .SW_OK(SW_OK),
        .clk(clk_100mhz),
        .readn(1'b0),
        .rst(rst)
        );
    Counter_x U10(
        .clk(~Clk_CPU),
        .clk0(clkdiv[6]),
        .clk1(clkdiv[9]),
        .clk2(clkdiv[11]), 
        .counter0_OUT(U10_counter0_OUT),
        .counter1_OUT(U10_counter1_OUT),
        .counter2_OUT(U10_counter2_OUT),
        .counter_ch(U7_counter_set),
        .counter_out(U10_counter_out),
        .counter_val(U4_Peripheral_in),
        .counter_we(U4_counter_we),
        .rst(rst)
        );
    VGA U11( 
        .clk_25m(clkdiv[1]),
        .clk_100m(clk_100mhz),
        .rst(rst),
        .PC_IF(PC_out),
        .inst_IF(Inst_in),
        .PC_ID(PC_out_ID),
        .inst_ID(inst_ID),
        .PC_Ex(PC_Ex),
        .MemRW_Ex(MemRW_EX),
        .MemRW_Mem(MemRW_Mem),
        .Data_out(Data_out),        
        .Addr_out(Addr_out),
        .Data_out_WB(Data_out_WB),
               
        .vga_b(Blue),
        .vga_g(Green),
        .vga_r(Red),
        .vs(VSYNC),
        .hs(HSYNC),
        .x0(x0),
        .x1(x1),
        .x2(x2),
        .x3(x3),
        .x4(x4),
        .x5(x5),
        .x6(x6),
        .x7(x7),
        .x8(x8),
        .x9(x9),
        .x10(x10),
        .x11(x11),
        .x12(x12),
        .x13(x13),
        .x14(x14),
        .x15(x15),
        .x16(x16),
        .x17(x17),
        .x18(x18),
        .x19(x19),
        .x20(x20),
        .x21(x21),
        .x22(x22),
        .x23(x23),
        .x24(x24),
        .x25(x25),
        .x26(x26),
        .x27(x27),
        .x28(x28),
        .x29(x29),
        .x30(x30),
        .x31(x31),
        .IdEx_rd(IdEx_rd),
        .IdEx_rs1(IdEx_rs1),
        .IdEx_rs2(IdEx_rs2),
        .IdEx_rs1_val(IdEx_rs1_val),
        .IdEx_rs2_val(IdEx_rs2_val),
        .IdEx_alu_ctrl(IdEx_alu_ctrl),
        .IdEx_reg_wen(IdEx_reg_wen),
        .IdEx_imm(IdEx_imm),
        .IdEx_is_branch(IdEx_is_branch),
        .IdEx_is_jal(IdEx_is_jal),
        .IdEx_inst(IdEx_inst)
        );

endmodule
