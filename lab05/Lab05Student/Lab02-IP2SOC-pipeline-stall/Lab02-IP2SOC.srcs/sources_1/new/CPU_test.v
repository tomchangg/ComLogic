`timescale 1ns / 1ps

module CPU_test(
    input clk,
    input rst
    );

    PipelineCPU U1(
        .clk(clk_CPU),
        .rst(rst),
        .Data_in(Cpu_data4bus),
        .PC_out_IF(PC_out_IF[31:0]),
        .inst_IF(inst_IF),
        .PC_out_ID(PC_out_ID[31:0]),
        .inst_ID(inst_ID),
        .PC_out_EX(PC_out_Ex),        
        .MemRW_EX(MemRW_EX),
        .MemRW_Mem(MemRW_Mem),
        .Data_out(Cpu_data2bus),
        .Addr_out(addr),
        .Data_out_WB(Data_out_WB)
        );
        
    Rom_D_0 U2 (
        .a(PC_out_IF[11:2]),
        .spo(inst_IF)  
        );
        
    wire [31:0] RAM_B_douta;
    
    RAM_B U3(
        .addra(ram_addr),
        .clka(~clk_100mhz),
        .dina(ram_data_in),
        .douta(RAM_B_douta),  // U4 & U11
        .wea(data_ram_we) 
        );
endmodule
