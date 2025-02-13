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
    
    input wire [31:0]x0, 
    input wire [31:0]x1, 
    input wire [31:0]x2,
    input wire [31:0]x3,
    input wire [31:0]x4,
    input wire [31:0]x5,
    input wire [31:0]x6,
    input wire [31:0]x7,
    input wire [31:0]x8,
    input wire [31:0]x9,
    input wire [31:0]x10, 
    input wire [31:0]x11, 
    input wire [31:0]x12,
    input wire [31:0]x13,
    input wire [31:0]x14,
    input wire [31:0]x15,
    input wire [31:0]x16,
    input wire [31:0]x17,
    input wire [31:0]x18,
    input wire [31:0]x19,
    input wire [31:0]x20,
    input wire [31:0]x21,
    input wire [31:0]x22,
    input wire [31:0]x23,
    input wire [31:0]x24,
    input wire [31:0]x25,
    input wire [31:0]x26,
    input wire [31:0]x27,
    input wire [31:0]x28,
    input wire [31:0]x29,
    input wire [31:0]x30,
    input wire [31:0]x31,    
    input wire [4:0]IdEx_rd, 
    input [4:0]IdEx_rs1,
    input [4:0]IdEx_rs2,
    input [31:0]IdEx_rs1_val,
    input [31:0]IdEx_rs2_val,
    input [3:0]IdEx_alu_ctrl,
    input IdEx_reg_wen,
    input [31:0]IdEx_imm,
    input IdEx_is_branch,
    input IdEx_is_jal,
    input [31:0]IdEx_inst,    

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
         .IdEx_inst      (IdEx_inst     ),    
         .IdEx_rd        (IdEx_rd       ),    
         .IdEx_rs1       (IdEx_rs1      ),    
         .IdEx_rs2       (IdEx_rs2      ),    
         .IdEx_rs1_val   (IdEx_rs1_val  ),    
         .IdEx_rs2_val   (IdEx_rs2_val  ),    
         .IdEx_reg_wen   (IdEx_reg_wen  ),   
         .IdEx_is_imm    (              ),     
         .IdEx_imm       (IdEx_imm      ),
         .Ex_forward_rs1 (              ),
         .Ex_forward_rs2 (              ),
         .IdEx_mem_wen   (MemRW_Ex      ),
         .IdEx_mem_ren   (              ),
         .IdEx_is_branch (IdEx_is_branch),
         .IdEx_is_jal    (IdEx_is_jal   ),
         .IdEx_is_jalr   (              ),
         .IdEx_is_auipc  (              ),
         .IdEx_is_lui    (              ),
         .IdEx_alu_ctrl  (IdEx_alu_ctrl ),
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
         .x0            (x0             ),
         .ra            (x1             ),
         .sp            (x2             ),
         .gp            (x3             ),
         .tp            (x4             ),
         .t0            (x5             ),
         .t1            (x6             ),
         .t2            (x7             ),
         .s0            (x8             ),
         .s1            (x9             ),
         .a0            (x10            ),
         .a1            (x11            ),
         .a2            (x12            ),
         .a3            (x13            ),
         .a4            (x14            ),
         .a5            (x15            ),
         .a6            (x16            ),
         .a7            (x17            ),
         .s2            (x18            ),
         .s3            (x19            ),
         .s4            (x20            ),
         .s5            (x21            ),
         .s6            (x22            ),
         .s7            (x23            ),
         .s8            (x24            ),
         .s9            (x25            ),
         .s10           (x26            ),
         .s11           (x27            ),
         .t3            (x28            ),
         .t4            (x29            ),
         .t5            (x30            ),
         .t6            (x31            )
     );
endmodule
