`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/02/29 13:33:43
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
    input wire [31:0] pc,
    input wire [31:0] inst,
    input wire [31:0] alu_res,
    input wire mem_wen,
    input wire [31:0] dmem_o_data,
    input wire [31:0] dmem_i_data,
    input wire [31:0] dmem_addr,
    input wire [1023:0] all_regs_data,
    input wire [31:0] mepc,
    
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
         .clk           (clk_100m      ),
         .display_wen   (display_wen   ),
         .display_w_addr(display_w_addr),
         .display_w_data(display_w_data),
         .pc            (pc             ),
         .inst          (inst           ),
         .rs1           (               ),
         .rs1_val       (               ),
         .rs2           (               ),
         .rs2_val       (               ),
         .rd            (               ),
         .reg_i_data    (               ),
         .reg_wen       (               ),
         .is_imm        (               ),
         .is_auipc      (               ),
         .is_lui        (               ),
         .imm           (               ),
         .a_val         (               ),
         .b_val         (               ),
         .alu_ctrl      (               ),
         .cmp_ctrl      (               ),
         .alu_res       (alu_res        ),
         .cmp_res       (               ),
         .is_branch     (               ),
         .is_jal        (               ),
         .is_jalr       (               ),
         .do_branch     (               ),
         .pc_branch     (               ),
         .mem_wen       (mem_wen        ),
         .mem_ren       (               ),
         .dmem_o_data   (dmem_o_data    ),
         .dmem_i_data   (dmem_i_data    ),
         .dmem_addr     (dmem_addr      ),
         .csr_wen       (               ),
         .csr_ind       (               ),
         .csr_ctrl      (               ),
         .csr_r_data    (               ),
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
         .t6            (all_regs_data[1023:992]           ),
         .mstatus_o     (               ),
         .mcause_o      (               ),
         .mepc_o        (mepc[31:0]     ),
         .mtval_o       (               ),
         .mtvec_o       (               ),
         .mie_o         (               ),
         .mip_o         (               )
     );
endmodule

