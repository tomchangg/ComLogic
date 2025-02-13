`timescale 1ns / 1ps

module CSSTE(
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
    output [7:0] segment,
    output [7:0] AN
    );

    wire [3:0] BTN_OK;
    wire [15:0] SW_OK;
    wire [31:0] PC_out;
    wire rst;                 
    wire mem_w;                
    wire [31:0] Cpu_data2bus;  
    wire [31:0] addr;      
    wire [31:0] ram_data_out;        
    wire [31:0] counter_out;   
    wire counter0_out;         
    wire counter1_out;         
    wire counter2_out;         
    wire [31:0] Cpu_data4bus;  
    wire [31:0] ram_data_in;   
    wire [9:0] ram_addr;       
    wire data_ram_we;          
    wire GPIOf0000000_we;      
    wire GPIOe0000000_we;
    wire counter_we;      
    wire [31:0] Peripheral_in;
    wire [31:0] Inst_in;

    wire [31:0] clk_div;
    wire clk_CPU;

    wire [1:0] counter_set;
    wire [63:0] point_in;
    assign point_in = {clk_div,clk_div};

    wire [1023:0] all_regs_data;
    
    ExtSCPU U1(
        .Addr_out(addr),
        .Data_in(Cpu_data4bus),
        .Data_out(Cpu_data2bus),
        .MIO_ready(1'b0),
		
		.INT0(SW_OK[15]),
		
        .MemRW(mem_w),
        .PC_out(PC_out[31:0]),
        .clk(clk_CPU),
        .inst_in(Inst_in),
        .rst(rst),
        .all_regs_data(all_regs_data)
        );
        
    Rom_D_0 U2 (
        .a(PC_out[11:2]),
        .spo(Inst_in)  
        );
        
    wire [31:0] RAM_B_douta;
    
    RAM_B U3(
        .addra(ram_addr),
        .clka(~clk_100mhz),
        .dina(ram_data_in),
        .douta(RAM_B_douta),  // U4 & U11
        .wea(data_ram_we) 
        );
        
    MIO_BUS U4(
        .clk(clk_100mhz),          
        .rst(rst),     
        .BTN(BTN_OK[3:0]),         
        .SW(SW_OK[15:0]),          
        .mem_w(mem_w),           
        .Cpu_data2bus(Cpu_data2bus[31:0]), 
        .addr_bus(addr[31:0]),
        .ram_data_out(RAM_B_douta[31:0]), 
        .led_out(LED_out[15:0]),            //From  U7 
        .counter_out(counter_out[31:0]),    // From U10
        .counter0_out(counter0_out),        
        .counter1_out(counter1_out), 
        .counter2_out(counter2_out),        // all U10
        .Cpu_data4bus(Cpu_data4bus[31:0]), 
        .ram_data_in(ram_data_in[31:0]),   
        .ram_addr(ram_addr[9:0]),          
        .data_ram_we(data_ram_we),         
        .GPIOf0000000_we(GPIOf0000000_w), 
        .GPIOe0000000_we(GPIOe0000000_we),
        .counter_we(counter_we), 
        .Peripheral_in(Peripheral_in[31:0]) 
    );
    
    wire [7:0] point_out;
    wire [7:0] le_out;
    wire [31:0] disp_num;
    
    Multi_8CH32 U5( 
        .clk(~clk_CPU), 
        .rst(rst), 
        .EN(GPIOe0000000_we),
        .point_in(point_in),
        .LES(64'b0),
        .Test(SW_OK[7:5]), 
        .Data0(Peripheral_in), 
        .data1({2'b00,PC_out[31:2]}), 
        .data2(Inst_in), 
        .data3(counter_out),
        .data4(addr), 
        .data5(Cpu_data2bus),
        .data6(Cpu_data4bus),
        .data7(PC_out), 
        .point_out(point_out),
        .LE_out(le_out), 
        .Disp_num(disp_num) 
        );
    
    Seg7_Dev_0 U6(
        .disp_num(disp_num),
        .point(point_out),
        .les(le_out),
        .scan({clk_div[18],clk_div[17],clk_div[16]}),
        .AN(AN),
        .segment(segment)
    ); 
    
    SPIO U7(
        .clk(~clk_CPU),
        .rst(rst),
        .Start(clk_div[20]),
        .EN(GPIOf0000000_we),
        .P_Data(Peripheral_in),
        .counter_set(counter_set),
        .LED_out(LED_out)
    );
    
    clk_div U8(
        .clk(clk_100mhz),
        .rst(rst),
        .SW2(SW_OK[2]),
        .SW8(SW_OK[8]),
        .STEP(SW_OK[10]),
        .clkdiv(clk_div),
        .Clk_CPU(clk_CPU)
    );

    SAnti_jitter U9(
        .clk(clk_100mhz),
        .RSTN(RSTN),
        .Key_y(BTN_y),
        .SW(SW[15:0]),
        .BTN_OK(BTN_OK[3:0]),
        .SW_OK(SW_OK[15:0]),
        .rst(rst)
    );
    
    Counter_x U10(
        .clk(~clk_CPU),
        .rst(rst),
        .clk0(clk_div[6]),
        .clk1(clk_div[9]),
        .clk2(clk_div[11]),
        .counter0_OUT(counter0_out),
        .counter1_OUT(counter1_out),
        .counter2_OUT(counter2_out),
        .counter_we(counter_we),
        .counter_out(counter_out),
        .counter_val(Peripheral_in),
        .counter_ch(counter_set)
    );

    VGA U11(
        .clk_25m(clk_div[1]),
        .clk_100m(clk_100mhz),
        .rst(rst),
        .pc(PC_out),
        .inst(Inst_in),
        .alu_res(addr),
        .mem_wen(mem_w),
        .dmem_o_data(RAM_B_douta),
        .dmem_i_data(ram_data_in),
        .dmem_addr(addr),
        .hs(HSYNC),
        .vs(VSYNC),
        .vga_r(Red),
        .vga_g(Green),
        .vga_b(Blue),
        .all_regs_data(all_regs_data)
    );
endmodule
