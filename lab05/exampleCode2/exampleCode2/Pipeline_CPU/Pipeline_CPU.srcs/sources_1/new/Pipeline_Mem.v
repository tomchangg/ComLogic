`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/06/04 16:23:59
// Design Name: 
// Module Name: Pipeline_Mem
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


module Pipeline_Mem(
    input zero_in_Mem, //zero
    input Branch_in_Mem, //beq
    input BranchN_in_Mem, //bne
    input Jump_in_Mem, //jal
    output wire PCSrc //PCÑ¡Ôñ¿ØÖÆÊä³ö
    );
//    wire and_out_1, and_out_0, or_out_0, or_out_1;
    
//    assign and_out_1 = Branch_in_Mem & zero_in_Mem;
//    assign and_out_0 = ~zero_in_Mem & BranchN_in_Mem;
//    assign or_out_0 = and_out_1 | and_out_0;
//    assign or_out_1 = or_out_0 | Jump_in_Mem;
    
    assign PCSrc = (Branch_in_Mem&zero_in_Mem)|(BranchN_in_Mem&(~zero_in_Mem))|Jump_in_Mem;
    
endmodule
