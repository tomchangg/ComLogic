// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
// Date        : Thu Sep 19 19:48:41 2024
// Host        : TomChang running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               d:/NewwwwwW/ComputerOrg/lab02/Lab02-IP2SOC/Lab02-IP2SOC.gen/sources_1/ip/Rom_D_0/Rom_D_0_sim_netlist.v
// Design      : Rom_D_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "Rom_D_0,dist_mem_gen_v8_0_14,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "dist_mem_gen_v8_0_14,Vivado 2023.2" *) 
(* NotValidForBitStream *)
module Rom_D_0
   (a,
    spo);
  input [9:0]a;
  output [31:0]spo;

  wire \<const0> ;
  wire [9:0]a;
  wire [31:0]\^spo ;
  wire [31:0]NLW_U0_dpo_UNCONNECTED;
  wire [31:0]NLW_U0_qdpo_UNCONNECTED;
  wire [31:0]NLW_U0_qspo_UNCONNECTED;
  wire [26:2]NLW_U0_spo_UNCONNECTED;

  assign spo[31:27] = \^spo [31:27];
  assign spo[26] = \<const0> ;
  assign spo[25] = \<const0> ;
  assign spo[24:15] = \^spo [24:15];
  assign spo[14] = \<const0> ;
  assign spo[13] = \^spo [13];
  assign spo[12] = \<const0> ;
  assign spo[11:4] = \^spo [11:4];
  assign spo[3] = \<const0> ;
  assign spo[2] = \<const0> ;
  assign spo[1:0] = \^spo [1:0];
  GND GND
       (.G(\<const0> ));
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
  (* c_mem_init_file = "Rom_D_0.mif" *) 
  (* c_parser_type = "1" *) 
  (* c_read_mif = "1" *) 
  (* c_reg_a_d_inputs = "0" *) 
  (* c_sync_enable = "1" *) 
  (* c_width = "32" *) 
  (* is_du_within_envelope = "true" *) 
  Rom_D_0_dist_mem_gen_v8_0_14 U0
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
        .spo(\^spo ),
        .we(1'b0));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2023.2"
`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
uwBH4JaTzmENPjp1VK18+NmHqz3idKCCPayqakkK6bYDVk0JtRfycJYNxbcnLmlw5yuLTcDXBBKk
FqBPE2n7wWKg9tfz2Y8PrWAvnbsIFMfxBK8sfWUf8PPnz8vUwwMHjbXUWcgCgvtygj/TbB+jcZ8Z
CjYnBZ8tNdKOO1iDLpQ=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Ff7o4KDFniNgPFT3cDZtw4HhiKzFbOFtLXtuci0MZhgQ8oZ15BcuowAfxUJXngU8JkWI9cbWKkG8
h/PODwnWEt4eK4VDKRk6Hw3QkZiKAa1N3QupC8D5bR7vJ/+RhJwSayz9t2JpdZaEhKgCgqTcX6oZ
4fCEOmSTUWVob+DXV4UfaMyfVm5VI0wxZ7q0mjFx+pdkt56PuNREX9kH4a9Ma1P0sYo8XaTpANLa
JC6eXOuUQlp40M9F/NL1Xajpys0YfGx8AveMAFEyfRmHZs+NbXmny/79vednrm+FhwtS9LveegmF
NZW9jiiR+9Igeraaz+QXPc6JO/nCDTr4Fuwusg==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
enb/INzHPP7GNdz8dyyqgVCJiMs9JXcjMywZXhzPersGm0A258UOUwtOqcF1rO7lnrKwTeWbNFVN
dO3BxXBpzGnYWUqDda208CYV9hTWFhfySQdX58qn1Z8QY5G7KniMCVjaGuPPCfToPOOdbAxR9XUp
XbMr0vrZKWxz8nBhGYc=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
RKZNANfa63/n14iwmSxsB/UeV76BNqjEiYgjlZ2LdFWOArCv6D+jhC4sjGMiaz8GJ8J5kQeiWB0Y
e1+zdHflgzODs6eVC82MlEcfgP0vdDIBn0PP8rVDg5O31eQuJ7n5zn4XJu+vzjpkvJIHKrktAsP4
jg+LRxcTOu0dILImk7Vwgyuwhi8OxNN+jBVbLVxdNj0l5aQMgRZlU/8FVh3u958SH7z/fHnwGaOw
P8QgNv0ZZblWvpxa8TJIwlgVb9354a0eyD9XsKy5VfuUG03nmputxNzUuIUmGtBGCqx+4D4pyCch
j/ixD5iiKRmeKD1/RtGzxmrJap7SAHMuzic1Hw==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
OQMD0qoDy+4W8+jfTV63GDTwmjWvJILCTofeYJTZqWc2KhrzQXwVMW48dTyIriC6bA4bmXD5BwcB
W2gGbVUvY1Y1+wEFEwYIC0LiPrJO0DhpM1JhP2vkxnTEwaODiEp5x3XqHgsiys0I2/9mE4z4Hlbl
jzftQ/8sVSYokhMp9eaIHk3HNCSBllv90qeBfH3fOdVI2gA1r/22PktttbkyKji24r7jM5o4aMIc
Sp6u0DCnD2cSPCuCuMW3A9sFRuTKbXiLAeeymFIAXHKYQgWXXOqmbKHrk4GviHQyz31C9d+hm6dh
RMtaCyWnhqo3QE/QxP0TsYk3CgkjDCU+KK/ozA==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2022_10", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
uV1eryjGs1SHbpKIAk5r3BY2SLKX9RlfGw6gbw/UtzBYt4U7vTBIy+x767ojEcmbGLos8kr8vilV
cnNOnsbu7vOAUIe+1PgpaPaCkv2OTPXaE0tfps6+Q6D3zB6j2a2FE1gRIPOniwAdlIn69jL2tuWD
M2BN1efQhi0lZHuKtTgzBOVXIg+zbTiH2k2kHWThOi6WayoBEny+g88wRi6pUBeB6aW3ezFYNmsl
zeOY9xmt+UhRMcr87DCcZdmjsIk6VrsIKF60y93pM0IoQ56iWpQ2OKZK+Ng9qC+pNHBEYEhiMQFb
kUesHtcFOIS7Ok6S9O9SMgf7lMQFOh9w0L31UA==

`pragma protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
GM2VxmvaiVBg1DsqOLewt6rcWtfH/Gj1QS7fUSMudF5qJ2fn+TXd8kcCwwrxdcXNXjoVi2As5jmL
yw1/NZreemrkS1YCJJDxmnE8CW2q9/4N4a79kApF1VfD5XdpaULhVn+Eb+jXCQFG+GEEOvnPb0Me
bbfRkfc0DAIWgtG2D81EQ28mg7KAWtsDpdUCi+BKdIAj8RXoTiQbFbiBeT7EiRIrz2PQF9nhQBfF
FjlrCNwDP4hRQJQeZcf/1Pl8SFyKGQb6iVF+VhhCVCunL7VBmzaCOW/gowPM7hRM2dvzmxcgeKfs
dZx/fy2rk1iokUi+3B+Jc6CycMWbHu8EfCh7iQ==

`pragma protect key_keyowner="Atrenta", key_keyname="ATR-SG-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=384)
`pragma protect key_block
NSZoNMCco4gpYPcg8pb9mtee1JxEWDcDzt6wnS0LeSPMi2upLvQXnSQKMvJGGOKStJOcu1eu7x33
4Xa3ApbjbfZ+lgs1PYlyY4V+B2Lio1EEo1uzZVWFrVFvmknOZwj6Gcmj5N/osaiqKaeIw7NTTbyX
HNHOabVsQJ540qnP4u/nzS/h/AQcm0PFLadGZtHJZEzyQDSSdghD/y/OLprdBcInfQDwAxQuJpCy
ExX4lD2WMrCkymNBS9NMH0vYh4kvpYKRO/oHuGcOZVg0p8vfMmz/BJDHuxTcS3FpLT0WxGVcmUIk
cuqKQFiVwwgnW9AfYkbsMrwfl9po2pofaAY2JC5ZTMyO1qEfSu4fxTRJNnDRvW65KkMdJhZFa36p
82hcDlaYvBowndZfMc42Sxt+ZULFDTFN0HT50iteAG1yEvJ9jKBiJla+kDQJB0VD0kj4+k8aBug3
uPKVykvf1/Uaw8NoW591pML42qlh8v1RzAm6aDnPRdsDaCc5Dq9QDPuE

`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="CDS_RSA_KEY_VER_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
oRNld8VrAuP/xHUguZzkh8+wROOItnvw1FQUP5KHjxeh8nudEYH2PGefTPsV73QyEruJanGifjCR
m8XHiIxqAY9fk4CAm+2n67YLFUEHjC1Qri9htrL4W5fnj7OIdzcwttvmGEuGOuYOFA98RcnR0jSL
Nyqq5u/eILCh2MiKiELfsBjRv/WckpboJ+gzO1btduECvdBGjsIcjjHiIzPwNSGxnX3G6zG9OiWq
hXP2Jh0Ril7rGbajit90p+gJpDpuLee/aOh0BUXbYYLU0YIXK8bskgMir7D6cfu5oWDKwYH6/YRR
tFjIhRzFsqwjtmaxUnGTZzxsWGazk+uFfHXl7w==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 9664)
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
