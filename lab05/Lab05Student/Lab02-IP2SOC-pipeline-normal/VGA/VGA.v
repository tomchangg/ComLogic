`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/05/13 14:34:01
// Design Name: 
// Module Name: VGA
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


module VGA(
    input wire clk_25m,
    input wire clk_100m,
    input wire rst,
    
    input wire [31:0] PC_IF,
    input wire [31:0] inst_IF,
    input wire [31:0] PC_ID,
    input wire [31:0] inst_ID,
    input wire [31:0] PC_Ex,
    input wire MemRW_Ex,
    input wire MemRW_Mem,
    input wire [31:0] Data_out,
    input wire [31:0] Addr_out,
    input wire [31:0] Data_out_WB,
    input wire [1023:0] all_regs_data,
    output wire hs,
    output wire vs,
    output wire [3:0] vga_r,
    output wire [3:0] vga_g,
    output wire [3:0] vga_b
    );
    wire [9:0] vga_x;
    wire [8:0] vga_y;
    wire video_on;
    VgaController vga_controller(
           .clk          (clk_25m      ),
           .rst          (rst          ),
           .vga_x        (vga_x        ),
           .vga_y        (vga_y        ),
           .hs           (hs           ),
           .vs           (vs           ),
           .video_on     (video_on     )
      );
 wire display_wen;
 wire [11:0] display_w_addr;
 wire [7:0] display_w_data;
 VgaDisplay vga_display(
          .clk          (clk_100m      ),
          .video_on     (video_on      ),
          .vga_x        (vga_x         ),
          .vga_y        (vga_y         ),
          .vga_r        (vga_r         ),
          .vga_g        (vga_g         ),
          .vga_b        (vga_b         ),
          .wen          (display_wen   ),
          .w_addr       (display_w_addr),
          .w_data       (display_w_data)
      );
 VgaDebugger vga_debugger(
         .clk            (clk_100m      ),
         .display_wen    (display_wen   ),
         .display_w_addr (display_w_addr),
         .display_w_data (display_w_data),
         .pc             (PC_IF         ),
         .inst           (inst_IF       ),
         .IfId_pc        (PC_ID         ),    
         .IfId_inst      (inst_ID       ),    
         .IdEx_pc        (PC_Ex         ),    
         .IdEx_inst      (              ),    
         .IdEx_rd        (              ),    
         .IdEx_rs1       (              ),    
         .IdEx_rs2       (              ),    
         .IdEx_rs1_val   (              ),    
         .IdEx_rs2_val   (              ),    
         .IdEx_reg_wen   (              ),   
         .IdEx_is_imm    (              ),     
         .IdEx_imm       (              ),
         .Ex_forward_rs1 (              ),
         .Ex_forward_rs2 (              ),
         .IdEx_mem_wen   (MemRW_Ex      ),
         .IdEx_mem_ren   (              ),
         .IdEx_is_branch (              ),
         .IdEx_is_jal    (              ),
         .IdEx_is_jalr   (              ),
         .IdEx_is_auipc  (              ),
         .IdEx_is_lui    (              ),
         .IdEx_alu_ctrl  (              ),
         .IdEx_cmp_ctrl  (              ),
         .ExMa_pc        (              ),
         .ExMa_inst      (              ),
         .ExMa_rd        (              ),
         .ExMa_reg_wen   (              ),
         .ExMa_mem_i_data(Data_out      ),
         .ExMa_alu_res   (Addr_out      ),
         .ExMa_mem_wen   (MemRW_Mem     ),
         .ExMa_mem_ren   (              ),
         .ExMa_is_jal    (              ),
         .ExMa_is_jalr   (              ),
         .MaWb_pc        (              ),
         .MaWb_inst      (              ),
         .MaWb_rd        (              ),
         .MaWb_reg_wen   (              ),
         .MaWb_reg_i_data(Data_out_WB   ),
         .x0            (all_regs_data[31:0]               ),
         .ra            (all_regs_data[63:32]              ),
         .sp            (all_regs_data[95:64]              ),
         .gp            (all_regs_data[127:96]             ),
         .tp            (all_regs_data[159:128]            ),
         .t0            (all_regs_data[191:160]            ),
         .t1            (all_regs_data[223:192]            ),
         .t2            (all_regs_data[255:224]            ),
         .s0            (all_regs_data[287:256]            ),
         .s1            (all_regs_data[319:288]            ),
         .a0            (all_regs_data[351:320]            ),
         .a1            (all_regs_data[383:352]            ),
         .a2            (all_regs_data[415:384]            ),
         .a3            (all_regs_data[447:416]            ),
         .a4            (all_regs_data[479:448]            ),
         .a5            (all_regs_data[511:480]            ),
         .a6            (all_regs_data[543:512]            ),
         .a7            (all_regs_data[575:544]            ),
         .s2            (all_regs_data[607:576]            ),
         .s3            (all_regs_data[639:608]            ),
         .s4            (all_regs_data[671:640]            ),
         .s5            (all_regs_data[703:672]            ),
         .s6            (all_regs_data[735:704]            ),
         .s7            (all_regs_data[767:736]            ),
         .s8            (all_regs_data[799:768]            ),
         .s9            (all_regs_data[831:800]            ),
         .s10           (all_regs_data[863:832]            ),
         .s11           (all_regs_data[895:864]            ),
         .t3            (all_regs_data[927:896]            ),
         .t4            (all_regs_data[959:928]            ),
         .t5            (all_regs_data[991:960]            ),
         .t6            (all_regs_data[1023:992]           )
     );
endmodule
