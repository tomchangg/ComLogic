// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2021.1 (win64) Build 3247384 Thu Jun 10 19:36:33 MDT 2021
// Date        : Tue Jun  4 22:16:28 2024
// Host        : WYJ-22 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top ROM_D_0 -prefix
//               ROM_D_0_ ROM_D_0_sim_netlist.v
// Design      : ROM_D_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "ROM_D_0,dist_mem_gen_v8_0_13,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "dist_mem_gen_v8_0_13,Vivado 2021.1" *) 
(* NotValidForBitStream *)
module ROM_D_0
   (a,
    spo);
  input [9:0]a;
  output [31:0]spo;

  wire [9:0]a;
  wire [31:0]spo;
  wire [31:0]NLW_U0_dpo_UNCONNECTED;
  wire [31:0]NLW_U0_qdpo_UNCONNECTED;
  wire [31:0]NLW_U0_qspo_UNCONNECTED;

  (* C_FAMILY = "artix7" *) 
  (* C_HAS_D = "0" *) 
  (* C_HAS_DPO = "0" *) 
  (* C_HAS_DPRA = "0" *) 
  (* C_HAS_I_CE = "0" *) 
  (* C_HAS_QDPO = "0" *) 
  (* C_HAS_QDPO_CE = "0" *) 
  (* C_HAS_QDPO_CLK = "0" *) 
  (* C_HAS_QDPO_RST = "0" *) 
  (* C_HAS_QDPO_SRST = "0" *) 
  (* C_HAS_WE = "0" *) 
  (* C_MEM_TYPE = "0" *) 
  (* C_PIPELINE_STAGES = "0" *) 
  (* C_QCE_JOINED = "0" *) 
  (* C_QUALIFY_WE = "0" *) 
  (* C_REG_DPRA_INPUT = "0" *) 
  (* c_addr_width = "10" *) 
  (* c_default_data = "0" *) 
  (* c_depth = "1024" *) 
  (* c_elaboration_dir = "./" *) 
  (* c_has_clk = "0" *) 
  (* c_has_qspo = "0" *) 
  (* c_has_qspo_ce = "0" *) 
  (* c_has_qspo_rst = "0" *) 
  (* c_has_qspo_srst = "0" *) 
  (* c_has_spo = "1" *) 
  (* c_mem_init_file = "ROM_D_0.mif" *) 
  (* c_parser_type = "1" *) 
  (* c_read_mif = "1" *) 
  (* c_reg_a_d_inputs = "0" *) 
  (* c_sync_enable = "1" *) 
  (* c_width = "32" *) 
  (* is_du_within_envelope = "true" *) 
  ROM_D_0_dist_mem_gen_v8_0_13 U0
       (.a(a),
        .clk(1'b0),
        .d({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .dpo(NLW_U0_dpo_UNCONNECTED[31:0]),
        .dpra({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .i_ce(1'b1),
        .qdpo(NLW_U0_qdpo_UNCONNECTED[31:0]),
        .qdpo_ce(1'b1),
        .qdpo_clk(1'b0),
        .qdpo_rst(1'b0),
        .qdpo_srst(1'b0),
        .qspo(NLW_U0_qspo_UNCONNECTED[31:0]),
        .qspo_ce(1'b1),
        .qspo_rst(1'b0),
        .qspo_srst(1'b0),
        .spo(spo),
        .we(1'b0));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2021.1"
`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
JqLVJNxQZkLohSEqQ9ITFybNm9QPcaTh8kyc7h4uGNwD1GaEe9dZHqj61sUilGTlF+FUk7afNjXe
+9yQ4e75SyWC3Z6F0o0CdI6t84E2VRqNvne6PMLMbSrRPmTgt8cbodbZa3saUKncQltVwK/zTxXc
dXyeIJwoVnylCRZ8MPU=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
RMR60V/K16S3hDpcgdlFzH6vzNttFBxzcEIP9k8l6xLxOXzEGeRk2beZg3IkkpX9ywpiLolj/ijd
pAlaBccK0sBT48q6qTKLouly7vRT3U8EOwOAJBZoDUnL/NwrlIomkg8Pj/4x8iecc9IFkdcLg53k
dreGnJ/4ti8Qi6sHP5Vsy0qpJoYpWsOBc2cmgH9vayWn6WlV7QL8YjnFQ6bQnWuyarN2QQK+bLzc
JrPAdTBzH05U9MiHwKRG1GlZxJA5fxQttnLA39Nwggz6r5qeYai4Vo+J8h0NQDa/GYHeYKSYsF9p
VKrYe14mz3CSYvF3+NMCtnCz+VeW7lF95iKCXA==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
k6iMAgjYok8KaQLMY/TME6/aSCYTKFMZWtHwbD2VKIKOoM9woUSioI0NuiYfkPizuiBJEl8Af3NJ
M5VmpW3SVM0lwPjVSCSNmHMIfc2krrmg962M4XaG4w+tnp7hwZbdNZ8ahj6pOLDYSTGKwdGQanuk
rIQbC+15rT9WEK2XGDQ=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
lHyAdhaPyzMCy12MalQZTt5ud3be/nityQmJ518pNrYUzgCs2nz/J1pZZgf+RWFgX9JUwWOgttjl
3vfihnzL/+pRWaWe8tlTToa5xX6V/jpw3hAcktXx9YKYreiOr2qpeTLkbp0k6MDPx0OZ6zF6OnXU
mj71WlXFOMXCx/95ZDxCuphivrOiA+pFZwGv2NIFmX/Oh4q8NTSFzJYzF3L9rWrI08UUEu9QuuxY
Iqlhuw+fXq//x9+jC7JNcedTSCXVkefBvZdJcbH0kbNA5ChG445apiF/OiKhKxTUjVKp7Rkm62fE
cFEo6KH1Cp+QaVxNQ55dcOTpVSSDpQGvshrQzw==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
D53lVPGhmka10zY9LQFvI7i1UPoiOm2NaQ+1PpDUs4OCbAMqPLHQSHIZ3EMPWpwgdfAtW9t+9lxl
o33XZq60DBUJ4ZKPRvcfbZCHmpPyjm3Rs8+ACxnIH7G37stehOSCzSXeqM9ORqajk0MjoE3bDLx9
FtW+eEPY1KauFU6KHAWAdaZPPnc5QfgBkK0c27Y7CfkJ049Sjv4lFwtiVOmSkCvdDDisv3/WAcSs
c5Zo+cJIWzw/prfWYTGIB0goZNZRXZpB/aULwQ5itLufopA2f9cHo50fqlIvQX4YoYlfQTXpj3Lj
Qd+7/1UmFCqQLsnOUXy9D/tgspVDu7POGbmsiA==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2021_01", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
bN8g8/EQJ5JNLmcuNioMXeo6xxPhQlbGMqXyUcnPTkqRMGYI+G4Ejpt9cT2XLx48MsTE+bzhGByG
1H1pqr4NO588pcozvxJ5bo7FJRCIhLP1e3pwipkX+z6IlClWyStmkrlQmh4o/jTM/s88Fv0m7FSH
jNd3hhAeYNPIdw9Btn4UcBuZre9QZnCZ+Qb3nW7FuuEd1RxTmP0y9EFC185+bRy+SMigW3FTt75l
qdmakEvm3BkGv3IiztGz6MLRqvBdHQYtaZ17Jeh1xGZ//F4QzRytN/lcdqSrZA6MOo1ObtGE9SFJ
SDo82E2CZlkQZfPVe6EC4/a7V7wIwES5EDHHnw==

`pragma protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Ewjro/5A8FySdAgSJfHQFGxdnPvtSB6vt25wsSfZkZlB9FCU7IhXRDEGCyqtZv1GE8Vi5CjQkNFt
lkkrCSRYIU5yoD/IUiSUo3oerXD+F7eyfUTsdMH8pyAOmszG4J/U4h2F0oGz4IGjnQhlKadatt3U
Pet1uDdo6p7Uz7fluWoE453v5O5Ag7QL3l2r7pK9QbtKW2b2ZgHI0FP1PfpuAESmBITtaB68uLNI
9IqIpc/l+MM956Gz3Ei4nFXbBqRkNnOoEIr1KKujTAkLJl3zAW45fRxt/SNdspyyOfwqw8HQ4aKl
7gQZLNfO7M9S9RaTP7tfDlNXrjIs40/SiH7VMA==

`pragma protect key_keyowner="Atrenta", key_keyname="ATR-SG-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=384)
`pragma protect key_block
BU7byHg11K8bY2oU9sv2hTEzfbBQxIL/wbPRcw3zRiIVklygkCLwToVotzcIxQi5+AgzzF89UJr5
6GTSf74dEO/L+7MiiVhop835AvOvvIFH3e15os3Ed8MZ/CykLdSs8kOVPSgygUECxKL/9FDmPOPu
fo2rClbqDh81jw/cX48EVuss3UxP/PNd7DI06TMx7v4Cwbv+pkvbuSJ9JUQBcJB2a2vbXuFSdPnT
ejL1XTVXeTbl2M6D7N0iqk4rwD1DAC1ao/d+axn50hvVPzigrvjqcQX/U1IENh7yF/bcNB1NT4d2
IdXJlmV2SEYwQNjb9ZTuSLUlehhVKrT3vH5zFJC80glrrjZK2l4tx9ZECJLmYjz00oxWf1dNVI0i
SuSyr3w6cWekzZQOv6vsFN+CRqWOkos5IUF5EaLFMFmcV5BtlgtZ9rm6OCo3zn726oQF5zZNaTBv
qrb5vLe4ELSA4fL4YBwiVDxVDpGpLzJNu+m6WS/V5oWJs1UQV1sRHSGu

`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="CDS_RSA_KEY_VER_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
dAIafnl1hEJ76Z8bYZlZKSAU+OyCQ2PwlK+IUKj9QNvxJJYU8c0z5dZmxP4ePLBS+vp0Lekmf+JK
ZmwpMP0AH+BW93Y8Y+QNBeNdszz6mwXF1zf7ZAzf+51PzoZEli3SBCs9JMOdSCtnTg1W+j4FkEYs
NWN3ZK6tfrYSbplsV4lsmoYu2c81xW2Ns3lV8YRQCE8VSADdb1pe8pEztQYXzBmAfCVgwFNJ1kXV
pEtDN1MRi07FvYZeUJ/cX+ebYB0p5w0vxVO4vSr0XOHKMcQkxb/64oEoe4AhHQNWURWYKDxNNzm+
jElAKl1fJL20OmItj+GmJlETFK09uAgqwtZ5HQ==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 17376)
`pragma protect data_block
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
`pragma protect end_protected
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
