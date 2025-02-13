// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
// Date        : Thu Sep 19 19:48:41 2024
// Host        : TomChang running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ Rom_D_0_sim_netlist.v
// Design      : Rom_D_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "Rom_D_0,dist_mem_gen_v8_0_14,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "dist_mem_gen_v8_0_14,Vivado 2023.2" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
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
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_dist_mem_gen_v8_0_14 U0
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 9712)
`pragma protect data_block
ypsIieUVDJFijgGPaS1WlzIJfoaPEJC18mBMN8Jy2fECo3v5W4zhkbj5m/ygxaJT7ULFQNy+YsqY
V68gj4snklOYR0wiNgOQha+GJXnwdfI/OZmRy/KO+DuWL7L5evNFHcMfEac/84qA71bBCX5B3feZ
UCUxSwlmhFgImno0k2TJfBPq+xPy/HERZjdYYA2RMa9UCTuC08iKiwrcFYw+IIkBwg2KWlSWsWYQ
SVagPUF92w5/FdEtirutWOdTlHyONUdjgeewrGSuOLQm1bk5FPTK/PLYBufgGNSLIiJz+pNozKM/
jZxaqp6vfLXOcsDmmj5drewN9iaxKh1AuW+ZM/+SYAiYxWFZF4C0aYTSK+EbUMo0jkto5s+Lmkil
w7LxZz5a+ek+dpSkHf8fhLQF4EaXrJpxOHCVPDML2XJ4iv7+H6s5/iTdlZpiwVdU+3/JPHm+UbOI
FxZiMD20HsW/vgQahekbJ+58b/H7piGNe661mUfgNuJLZc4YpEbhzNDxJKpo9AHwY1ND5yd6L5v/
GXzabX9MpGbVtPh1qoR2vNLePbj8W1zsaBhRATrKxsUuAUFGOhuKnOvHSe9F90lJcBBVgpKztkSM
6FnWiFViT08L/ZJdifKHfnTrKaKGGUhXeCo5om8ojJTFgDxBRONo1teZBEr77BvypWIvRatjlruu
FSjBEMI8IR+pAM1M22SqRsLe80AAhftE7cqLwZ6HGvVybg2HbTl9XVV30RfZ8eNM8/+oUBTLYVtd
FFO5ClFX8qEYbZtO5adEa6u15NgIqnS2h0mJgc7sm8S34xr57kvAW3qLIm9+o11eWYKa5hYuzfpe
0ffQDedrnpoURX8F3kn3aDXWFx6pef7BJNLxM0OE+A7yUed8+yPjAyZRjm/q+K6BLHZJPn9MUfsy
gw5NDlWVF9tPdZyIXOgKhL6LxnogdaTUCdI0n4+a/ojRyq1Tc6PA0I0F+jSH+64a2jvsH6V9Izqx
TwUQOXoKjzSaf+aL+xy3tdsNro/8nPz9buowWUG1OXNzDs85wQbUseCLbcWwPdsbmLiqRm37JBfP
u9I3djQO3RgOmEZOpIiEOWeiBisjKq7ehGqGhVZ2Oixbmd+eGYuXPx774TpzZSOG9rf3LjzDVWkd
LFdds/Qhp52fm5lEPk4L/LDbdaQWA8Ek6D5duHfC9t6/RGLLjJDe/MUsv28labDv+ivyXUyLe2fC
+QL9+6BFuLnEPTLTIMoKAnsL8WO7QcW2rDiLNtpPDWjotSYFefjg+e+kUPDPs43qFVALi6gSn76Z
NGFpjkUEeZbkBDHTXTi5rmhdBM65dVLKhcJgAsJMnMwvU+XKP9Bty3Ut7WBDIZdcAaP0FPQWmWow
M2aC+scmhYCK4FXspoMFGOEcTKVAj0NHSJ5YTpsExySubeRX4PPnnBM9iq0EIpQ0NOQGGOdPlW99
NdupAZSiZEct3gsrgDwv+hQ/blrXuzdIawB4KTBvYzbQZOxLhbvVqy3o7cI2oc+2IjBzbYTJlJhK
zVNV+3qfzVc6LbJaz/OvHMTHIBsGCFJYwuCb3qRl4rtUbKPkmFf1OqHqLbVHlWaUnjyPUwlZ7TqD
1/H2v1/tX27uWcBPZIjXFXuZENS0+Efbs+s8pgEhnH1lrctgeZJ+vJtGtXVn/AqDaThjr7mhKtvL
zGCh601s6r2gluF5BbdPRBVk+2CZUy5oFiMtmYxxiy+qjOo3cSzAA7QjjBQiCsMmfBFL7NUZHNC5
m/EzgcJ/mygc8DWrWN+ozoFk0mvR/PFOhM2JAN9P8aBNq6DJPam5NQpvF9Jz8dCo8b3bl65bOzTu
gITBPIUrywPHqwbgHTNQMyzVUjRJhPmLhgkEVREApuiGV2G4h9ya6AXXF4YuhaRMqeAycWPFkCuE
uKN6OO6+rI5gPnSfhlwuBOXePCjDLUTAfivSbyHWckzZfxSsEnK0++y1kxaaBYE4Z21L27bVxAmA
WsT36YoHLnnOyEgR7K+qqSOf3NpdNYVpjQpUEX9gdcyhl8xZ2ydR9gYOXJpUAvEl+ElNlj1CZr51
d0s2j+vpcTB87A55i7/B+EMCx05vORSiRn5nIVMdJsa3ZoS/CgG/ZIXbqZJDWtIurEL55AKwhGzM
l1c8tfpqFIab2+pQCgQTwpxQ0kflHLHCA3yZiQzpm9KEQl9KrYodyWS0y272aUsqz/F5JvjGgaXR
8FHdC2Jt6ehwnTS+En3wetRZmnZpAhCSlKukfY3Oi2o17mHcCyQ6DcImxymDwZIeYbC/y/GBbvA4
yFoLrfkBokY4uFdqF1ntjf9ufN8W98C2tqyXE1uFmF/mahCa4z+eYNgA0jqrT4yUgd5LWt5uHcfk
1HvogE6BSedpdVg+5ZF1HvfHPo5SQt7022ThjwSiufEZCP7pQ1nX9XkzgXLqINVKawJiETDWfDvg
vTkS9UcGVImsQBZQzw/Q8nmRnh/Az6gewIne6sz1DHVs2+DNYHrUyxqInGlrH0j7h3x6wU3+Rtfz
HNFOgRKJLoIGnlsgoSGIf6O0QbLcXfOTLkw/8ylQObpdtkCwtGoKARJuP7WRoHFn1yBxpV+Np9aL
5aiKosFaOIssgSQW9ot+ijzs1k6ttwRV6BTD06Uy/hrcRGoIcJjY/tXN4cVcJzTyun1bQajxKedx
3+elXfQsiYsskHBTyl+t3y6BZZ1gnfG3IuvFCfDMldC9aGNP9+OWnmggQhPCYUhQxnOQ3qp4EFFZ
OsNgNCU+5K0s/Pm8JQZ7jsu10yIZ89je93cNS+iCx746aNOha01L8mdm8Zg0329ueCFRbYevRlgR
537YYh2U/r8W7HI2u9gcwG1+I79VgG6DVEAlh+M+HX6W+qlT3kH7aF1xb3saTAzU3hOnXml2TVhq
jV3SxVQmbTngxkYE6x9bZFyfZ3/tV1cggwPNEI3mDG7zhOoT/cnAWuNWTId2C5wA25Enex0akJFm
L5VNQAPDyWvkypkY+wuyPKTMYY4ZRkUBRy9b0dmdjajipnYZpnrQTzuyzSls4tzc+N8dVtqpBVJ9
SlWynxQ4NaOFGp34hCkDhtWARyX01lgCm8hlCsRau35c21rbha87ejBieXtSDfAdN2ixXJyCInci
vhLwCJhgFZVdxuF+ExLjPWSTP022CP5Cc1RMswp1scJtMTEBiIfmitORdRQbjNwcK5l0L2T7eJr0
U2cwXi0ry32OkuUzibOJ8FbS9c6iKooH2ncIfzLQeYX0cgK6NPh/9J8ok6ductWDbo4zyGAKuHf0
zSpOtmQIrd0zvfVT8C+LfVcWvufwWxJOe8CxWUqKnB0LwWoF31wNEG07Ygw+xozBegKaMZw9Z0gS
C7y1NKBVPwPiaeK105hRK6xGP4fv5dNZmuycEE3speY5kO1Jy5kdwqFdyS/3kqzTm7/mjCyoCawH
wfMGrOO6QTOgR8eLpHyqFaboUZlf1v8W+5P58XE18bInBzDUg2tiErBv+aNSWsN9cOWqtWeittNc
dMxjrYJprRCzQfGEmG0Cb/uZn5ZJfq6/1Xm4K3wEfDqTTV4LQmYnr6TKkRlIYin4VdNQTdBFppPa
IMFG1kHE2kpyp/m+cgoDaFj2VGxrLxuiFPIc/f6folhxxtjuY4MSU2RETO+oNarNMWspeeXuItlt
wHmDcxra15Tbi8z9r8eUKA4R99PyFzUodgq9RYJMGreiPNGTehykGafskpKBtmcT5PZoxYNxIoch
7SjUtfpNRxTaMhAd+u6b1Q40FgG9GV7C/mVjOKP/52VH/NLiWFJ3KoKRb4KcmomqSMbcuvv6VQXV
eqX1qK33YmiBXdchu4w5YzclewQSEzoQ0B5Yxcy97eywvb3p23vA7VFETFFDxL8kX2xFtvtd36Fw
I1mXCn12Q36u1ajyQ1zuVqxfjGRahhGwGe9jSR2TP+Yk0QVPt5YY6y8wqEpKaLuBlbRpmStWSgAz
IgxUUuF84kycIUI7n+sONkfAopCPB84gGk+V5WqEz1uP8PeLuzDNBD2kxcHLi1DbCCkvAyp1N77U
syJMxVT8wuia9YOgxoeQwk55mo9gZG4NneGMzT2ajwo4nojCMllZfuGDIFuGkbJJRlHYm4prOwgf
hWtNm44OJdUnpx+tCPixWck3KFxScKHs+tRBpYRE2E7l2tJwxyI0cRc6jadJjkGJcGemhfYFF5Y0
aehRzDPV1MaYas4y5I+MQlVaVeCDCgpwYECHLAP475kiMtFyxq/puLdNjRjlTH+wXXzsnr+Uasj+
eCnZo99X8B5rCmeSAtX3+6zqYIYl+ptcKaEKO9osLbMcoD5jqyzkvawA2C39/RSgrv2JTODppyIb
OraQEQRTYHGyLdpEcQremoixhEjalK4mAQn5U7IMnNHXL9UpI3brJWyHzARTfpVJkOGeTMWroia+
KH61wB+2wO9+6wz3YGzHcTQZ0GmTiDbVIRPV09D2qDsdPn4F1rbh1uqiyG+DsuIGlc/yL3AZ+/uk
wqOPRI08zE4DcGjQ+ayid2n0RZft07QgDYiNRoWhth/WhjSu9LdiJcUlOYmL3mkhvlZTiN5MNdfb
ChQbUbZi8Gg64b4VSf84uWaeFSmmRMXdpY+UtmOOgEIxGGI+VIp5mPEigqE7ejHmrqkkDIJ6l+sl
MFjP6gMgzg3P++2CO7LmtI0LkfEVqjOUmc5g68utaDDkSZrpKpn87XPDGccGrtOaRGqkPXsXfOyT
rcQGQ34GHoUSS+aCd9vuiShxi5H2La+cA+NBytaF0GY3efi/rmob011+VdeLxgoZ6Iv8D2PcnRna
i8STZpnZ+K/Y/jihbzyOh+XWbRsGO0oQmRL/vwuuxwag+jXVu/CBbmWThyjT95GFq5pHzyOxnDku
81KO/HDlDdJ5EVmGyPM0VQS8sS1fztvI9zPwmXSD1qfX0hvoJw5tlgmhYAdi3ORgFyknp0e2lC/Y
aL24TIoXml0swn1BJFUsqjPnylK77Z9+/Ixs/VVGaja7Gta2YwGmNG5k+AnBQubfKCppsQ2ph4EN
cRT46GUXsEcZDshg23+IVeaagE4ZXotBx8gCO0TVHs35opzjc7suqcM2yXSRufhkQ6PRPYXRPrap
8wSFdKMHamfnU2Dlxczn3Hw2SjOrNwNjkSNXZt9xYyCsmka9V2dvS7lk0T7XIB6n2F+gQg8+2biu
Aj7eWyWoaSgnC/ESbbh/VVLqSsSYu6lxyOCpP7LnNGIOQlFC6XUq2k5+IvNouFWnQQLakNdV7s6E
tI837wVdjPP/adv6xt3kWBdN+R7vUkTGu9tyHT+H38Hsd+yFB1xdHAv3mwst0r93uckzDS7gZw9C
r0jTIb1AQ//109DvmylnbS8fhfP/YdiIGPM9ArnCNNfNf1dOqrcdD3yLFMb8Ku2y3TJTLdLVDRjr
OGvQ0bhbeN4qSI0wh0lT3tMP+gz11ZmUgemU2phuaYYS4U2u9ywRsyrI1cFXHIjWgM8w2EnSBI1z
agfaXXD/GQgUq82z7r15C5+gZiNhaxps7Xn3+dldn5pZXunLC3nwjxEe4uiu/GgweKTTHf60LeR/
MA38BhXBLLrNS9jacWvO/8EsLYoYe3sumRhNzXMHA3jD5QFJ+YiN9hBkK8MExkXz2TjbXPHh+2SO
9Qv9pxV5zNH13nE1YX9G3/shVQ2uOkfgasOwdUglKbd9FT1ek8iDIknU5+TPkhX+7zh3oZIgFGrc
rStoOtlWebK4BDZzlLJ1Hedb9VVojC74o0NUJn4B3nzHL//gMnilkr/54TnZ5l4OkXNdqO9M1OTN
01Z+drdV6yP69NtWON7e1dtioFjg/vZ2ttK52jR0LQXxUJx+uDcCqIbJ3CbUwJ7Vz8wW+TJ4WEau
jYXrJI5uXwtWRxbeHrmflu00h2+9pm6H3DJsSe6y3SGC8aQ1WXyxmPT5pbEEuByYHvrW3b4jhjOE
/T4LV7ysFAXXTq3tpUEZL2LMrcNyFhFfqJWbVY4w2wT9L39DT7QKwYVaNSiDk1l5QTpgwBC5nrno
2nC1u58Gx/WaITleWRE9ipjHN7KHzLbAU/dbFJLBUeG+4XxGXOI+s+odRRCa7pg8627zASeM/4d0
922ZYP07fpxAx4zn/sg7UP1+xS0BMfyVOdxFPVchZCDyIcQh/jtefuGryLKSWy+9cMfsUntCecfy
uqjsaYyEqpIWhWzGO2PQL7uh1ncz9AIxt51DVCFtAi3GnCiYr5NFeYD5LSCk9VlE6WjTaprFLHdp
WX3nXXJTIX4TjN8Wb8OSZNiVlrajT2yYSNaReW8Kqv5OxvQfnlr9IyjskLoeLJiEKBqpxWm4iBB6
15hwcD2+Srf+c7VKggm25ITRpfnBsanAYZzUa/ej2rs9pwlaZ5scxFJyyWGYcdiYTj2D0jbRVGhp
mbt4sXYRxaraLaSSmgTuIDpF0+H1PV93X6DbZxseyDXeKZhLS7MNhYebw3nsHPxf510psD2zZZJO
UF8SeUh/Be2xrLDpdcTUaafSidX/yUSlEMhNzF3V68/8Mp8jI8Gyr1XR4uQj3UyiWfX+f19KjzK7
5zl0m3QZ+qcu/9bF9w/o52gPYfvMGjYvKpBdgW4dbr7Vmu8EfAH3ilURL03R/33caU5cIHkeUxoc
CpqGWC2BfHpVsnOCiLu1nxqYLDXX0eSA5GVghGLBqzD2d+GVUpnGCvVHNsq9NilDmNPD/JmSijs/
Gl2y/K+2ZiqY/bqBjS/IC6x1hj9AUoVrzYu0LCXP14QYUXSbPb02k+0AYzFS50yheMexhj+29Xe/
CZbkrwSFpNp1tuPh0zE2HFjKb+gQ4Gv2jWLqDFEqXnTXBvNqahzYAaP4LaQI1ZNQsaVU7PLa9SY0
6nnPyY6fmhBrdmJ8zwgN2pxzYZsrqmR9eqUxOVp4BSbeeSmrLDOnAfnMR0sLExb+WKJ/Uw7Kz+VS
V4kZ5vXiwqLX3CnEurkmWErxNdMd9lps4Quu8iHpRMhNlfvcCVwK0Pd01DQSwUi7v2K/TCKUm4wO
j+DxlAFwdbUGFbF1+YdYPsqgoH/70AoMYpUBGsJA4ue8g8BdOBjqYggtUlmRjXL5XfWylZuVNUim
Irx4VhN4BCpKf4A8HUJxLZ+8CqlPxjT8sKRWH2T1wAYpjIbH0UqjZKM/3QaWxp4Frk/eYklRkcfm
YeGnKYDBfl+5j15VGG40MSUpvW/+a++OA35JSlIAbNwolpYFltG7PEQPFNi64BECgQc8b1PFXizz
Ny4vuQwomkiigqvPo4fCzB9rWs1Qq3Jvsms3QHIMvHECK6eJg2/Avld9IX8VIac89DcaCt6Y5tF3
uRjie7KN3G2BnaT8v+iKp3HfUblhKlESwHH9LV1hqmlkWGhCoVCTRZKhwzxgTZMe/+M1WyM/Cvxl
okYZVJfGNVF5E+QQBLIhgQVftzzX9SxbRnwpinStRz77JWDaM0qBF77RaEoRVxXJAgyZHPWys7w0
tgqtKpr3/HZJLy1VW05acjwU+PKApXNIyK3JF0Wq0aO19TxzhlIsN7erHdb+8x8nJtvyb3RT3PNv
KjqK2HJ8Nqx0WvqvclOE2GwIvWYyOOXBSZ8Z9uqQdH1U2y1Un8gQFhaxFi+f6zo/CK72sDvYYPav
hIDQktjx/bxRwGUFdUkZTtIj3PP1rQ0LVzO8RsFhpvrddUkWNXxPitdXVyP6QZA96AFfxsohFwNd
w8sArWDNyMShOAWEqv6jelq76ExEFjdG5hCuuPeyAYp770lVqItMB2xKLHERycn0KOaIxrHHuaQu
0C7THkvB/sa8xL8uR9CKgBaO9iEnFFzmh2nXHsvAaP3lovOww0po359eRBLbnpeA3m5xU8S/M/tI
GjKlca4O/4e7EGPRhTrW2195FaGhlF/nIF0Z0oFA0aQ7I19O7G2GaVlfeJeq4J1JQJSumqjpp8oM
41O2OufIePcjRgHT5W9NiENWlBuXFynInEEEDv5+uWcfZrgxXRHAbcI+sREgwIeAVNoDkSrEl7Ds
/iZDm90tGekTd3rAbIAmri55iXN2I3SBqaZkK/KJuuSZcXoX8/EcKc42DS7FRmQ+tMiXg8bAnr+x
NuV4JTIj3CUhd3jlx3UYOdHpRAJDdkQHhxoK4kUOhBKHNiwid+hFmOSheSW4x+lOr61mfKLu2Cz1
FAxzHQfHZhBRm48kX4AKtsfuHkjhFhBz1Z4eUKCHGnq3zxoOsxEMmvcobPoBRKmLP4kclTu+eiDK
yvdi3I2RkaNy4tud0Odin3vJ2E7M0q8QBKpkTNVTSrEIuhyeG9qa8DRjqoHk2mILkAi3exBxDcqL
50K95DmziwVQneqzDG1fYkcZqiYJu0o1fQ3v0WBFEp2sUAmiqN2RyEUL2qwXx8sfWuBPqSx3si/j
T/CpRAAUYzNw9Vt5/61Dkbbc4h+77D0x+Qi6kYLg3ZZaxCWdGwHSDr0PR8wNZVFxfzZlkRiPE7Pf
sihoITaYaQb+spixGvEKGgSwrlsXhDZG7ft/wFTZuzuUng0EzQl/TNZBOBmFs2U/B4yay1FBkkHf
+cCAcEd4HpAvpzc2onPiKpb8hbQfRkUuURNGB0Vdhxi4fAh+vRb/ZlnZvdTXEn9wK+c7Dlg0805N
yAB0fP4pIH9AZT9x2uWPbd69lRqKXAMPksRP/Sic43D+6JykTHMcndvz9aGdjcFmBmlqZxklggsR
MypEmUKcHZFX12DAE/pqJyA/yI45eHdn+Ytudb/LPE8pPYq/nwktfLnBxvitZ09Kygccg6TxhzVN
7MZghi5iS1fyLfs3ojn3zJji6xUowbiDgI8SLspxUK9qS2F/FaoFHPQM44FNb4LQhRXgP5OzKQTw
pDUVWwfMjvQAHEFdqtrE2GTahtLW5ayRzxvy0jy+wtN20SBWD3VQUSnhWZwOn6qpSc8XGXishAWd
z1TPjXb70pBWEs00Lmk/1bEhZwtE/+COoG7MKP8wfa80M41qD1Yvd4aplBWxYlAxwNIGD5QvxjKL
4UXaVVLlvserxDSxUQBJJI+V0Yjrgwo3EfvI7s+WDP3N/JBkhKWxxfOddLL7WyxPTls6c6orEtcx
pp5qXOdODlJ2K6GEpe29tF35n31m9Jl3maj1o41w3KGVGbSQuMbPpPPfVtQA6mq0N3HSaZMIdO8g
oOP0ql4YlCt6MLoimageMETotCsBInmDCy6CQf4Y/AMj25JVK/4eMeRt1fLhbmKVHKnCX1lj9Bba
jlHI6X5TqY+8YygeBepdNK0VL4D8GI4DIo4binCkixZ5fB41FUqz7JSJL/w7qHZOkeagsO3mpcMB
SP4U/1yzB9fpXxGSFBgtolwVKMcor3ctRbgF2oUH+5lUPDySnpAH1xdeUTQroBfQCuUEPTKdoLWi
NbYZdS6Hd2xjQfYSvH3n3ZLgUq9pLdWoRL3E/PAXU7o4y8lbgW5DbvAF5DR8YPQ1wI3Nt/Z00rKx
6A0R3iSgOz7UbCixXJqt9/E9GRRUklGDoxS8oXxB4u9ULiDEcGRZhzPBStwAWsqu07AWefiR6C+8
LE0a7yJ8qazzr/ZiMediWBktQcgoWaEXkLRcXO+0f6fZGmv50LCWpNTmHDvaIufUF8G86J+WSekK
kJix6Y+Hxu5WtzUbVVE6/YG10xPdy3HmyKf34C1ivhhMhVfl9bzUHT7sqHoUz5+96RCxz5sUd5mO
h6l/r3PaQmWEObKsjcQIpETTEGF7aBZ3TO+fbGoPPRaqGjOIvVecpKE1enhldYczs2svheODe4ea
g0kfKT1x+7MF8bGsZEaOmSQmrCiCev0Pphi6yzEOx53ojkDZviRyG/LVjLJ7LzAQVVNcXYPxY0Qh
EY8dzzvRVM0HjHrfloc2KvBI0oLaNFPIQDNYDJfOeA1zocror2nwRVHGGjC19MSbN3O2S7aM1ZFc
dVppqzJfReq3hV0pU7a0MFdXeaB/8dosxhdgFbx1R2soXNnjWDTpKvK9TDSaAlDpaEEqdoFg9id1
cc7YEJjy7Ai27IhmYY55GkhVtKDKoccKvlw9QdN+i3nJWaJb+qL2+tvaB0NL2LRP/Yff/oafEawQ
JBTprsZC4EVlDSggDkBoF5B4J1xYA09wZRnLR6zsAG6D/CrvQZvsCr7xnG4FbTnxNwTNIpRgQM8y
sxz5HDbqounwI/phJE1txrWalhys14a07u4qwswHJ1yJRM8be412lQc12Yf+VosiU7AO7zfPgxtr
W8sX/qtSs1IMdvB2tdmNvmKiZgradsx6/dZ/SWwDRWfLxX1PXywDvMimc0WKKwFx32aG3OwW1NoJ
OQ2B1PE9QOOJnJriStYBQqSrhkgRjwemFcgFcK7pzQ+y1/DDBvR6F+pRVUbYa+HYx8HJiqzjzAnZ
/gAlBZt69SJ19ndhUgvN86oqHUQ0rfhKUNJ9gdrprmtBPEP9X9zauBnz9wkZxi97g3975uH3OBwp
iymhQ6pEINMcdpt+UMsccDAKlhSIMWrWJ4NC3zrhqX1QnBlXLZSa+DF/X/pkL7Ht1sESTueUR9Kz
zAAow4LR/zl+fz9tazYoP4TExwy8ThN2QE7dsR4I6+aj1oO9SHf3oCY1MYNLAIhsWi4bMeVhTpi+
SvyImsnSFYvuvmokel8F2sWuBO1CKF5ivI/XZCjx4S6CZOXX4WNyP+wAZmmSPOZ+PuakbgZtIn1V
5pJfH9rrQN+IfHuoEFwBxfh+TcDtiPpisNI8qHPOu+SUsTmZRDVKWnlblnWcKdEfcPt9XKfPuQal
9uFKbDtL36qESa6mpHpKMO7Y6ATU78s7v+UxsmAWlmimAQ4563czUDkD0PB073Y/gqyh5+j2aQkW
GZeDbQEzDfc7QC5UnE8noTrZG3f6Ys+2PEgTSBfz20b0X5VPjaA4yOPAJtPyCiY1ihiLGAi8zEP4
xroQRHV7wCwObRgsEOFeqPzcyk6Vx5T7t/7drkoTeRX1BmrU5MtoMuAU+g0hGpjUJsF4yQTgdnZd
kBeQyPO2WRRFPZ6sVWsd8N/zfbcHLx6ZGhiIY+5zB7Etp8JE8LB8r0uMMd+rJPVwN2WhSMqTGYb6
tRraoumrvWOvpnt5YNK4M7Rzrr0t0kaOVqz3szcz6HuoGg/tXJteFqiiPdY2aicsfhgCKO0us99n
R1UEJ1fDhmKFmWdKbkJsxOwAFhEqmjAOgPAlPVNPgVz7eA2g+jFBEimypRKTA6ne9A7TGZOazZbH
Ny6RLHDT70pc5xWbMBe44wRcaUZ5monAQp8t+Tb5MriTl44zZPg4e52B8uEopVsrdDv2URMovjfy
E+ypWgRYcAXe5Uu0PD7+JKqsRwsbmMRdh3C8EPXL6C95ynglSVhZe1KwV7Y4G0xIvxalhLKbOQ0j
pPRvAX8DRZpaAow7U57m0zDotLSOeNahBjWpiJQ9l65SbQ5DnKDkpa15qEXSqrfd/zIzs7apQXex
PtuX3oX/wC2T5YhT6l6rccs8RLGe17cKPfIo1B69zeq2n27O3Z9dNt6zsK10liwnQ/2IHAfAUl/7
jQBUc9emeZZ50Ij52lbl7Z8YvufXJo8xPaLUH9GkTC/PE7RayWHLsGD7tGQ3DGIwMob+iXDY9rsJ
UkzbQNaQNy9pEOEQS3hTVQl4iYAlHFes2lys5Ngb1Fs9J1vz+CMveoXcd/ydTDcUWR3MluQPNYNX
9EFqYtFSkuZGylZ8TBcS5Q5rQ/LqHLK4cQmZ3S/Djj+iwdmOsgD/qd8ouH4x4smnWtIVvbJtqp8z
nQm1GpMGp6tERs+hNeQlr7Hn2Eu3gN0d2+q2mXY5GiPyn2BNO7k8LJj3I9o8kP4bh1jnBFVzZu3i
wNBKWT20rsCZ3pEoY2khRkuaxly8NGFMPOWTT9YngwlNUbUOydNvDyc3bdpsG/c1ULF11w3Ggjsj
Z4hINn5wCfb09DFPf7+D2SDRyFoFSW0NQF5fWyCPjko0TXw/v0QkNn7cV/t0Bk63K1N6IHzPjHsK
6h2Z6NnVdr6D8lmSPOWp6W/6NZ06zMbzdRy+gAh/yUSkXk7FJkbemMd5Bhx6Cfto+B/GeYGDFlbC
X/SjUM3reTiK1+msc0dp0+GDphtj3GJH8apBEsybcVpe0+Z6fuqfrQguir2gsVzPE4gHTo+Dq3ZR
qVu344gu8bAW/o4Do4YY+pJMnu4fEc3v+5yrIBrK6WldpLcRiXUk4hy+Ra6AahiXFevtv7pAyBnz
9cFLMvJoahRU7DSHPxjOpS52Cm6bKhe2PwXjFKI2jMW/+khEg0AjCN8EpUS/7VNeAVzZynUrGw3q
DGnOlJfug2Sf29PXKUTHWQZaA9g2BwURVjDmIZBXNTlKbbo9VEmTAwetHDiitpu4UDSrKobz7FcS
6MbtPRHYvkcNJR8vrv5IXFEB5Ye+An/Rf92zdiKx+TR/jf8iebU/eYHnw8E4rU9N4FsnroDK0S4x
D0tm6rLzmoiAsdvMLWtsmxuh4IyJKDxLqIGWPSqf7J5cuJcgElHSqBDt9OgqjWKMagrfJcVI4rWb
0BS/kBDN41oQH1f60m2nWrhe2NYXUlyNlswE2DkB7g+MStYKDrXQVhabDRTqLvaegMuhwyq1JYrp
kvCunyqaysa3Pu7Tf+xhHxb9QTW3T9FuUV+eRWoSkbkMoDnt14ncoAKofj8lgMhB329rmAzaS/O+
3FHm98aWZAv1l2vxO9b3NqE2bzkp9vomOO35saz2cWrsLytcqIzN7M6V6sN+A5Ez0Knsog6p57ye
GHT0WZ8xvtusxEt8fJLUfEfbWAXfsK6sFIvGS2Ps3RuX/6JfJguiqtAPY9ZoTPnCOKkdpld73LIe
HpedJfoHYI1v0eqs1krEhVZ6jJwH7sbkcTezfzK6rclKL3K4f3ykyjYytNg0pVMTIh2KeOsZUq2L
kRwosSTCrADWUmkk9y5LwOuayixFa0JDLDrwNHEuuq2qJvOxEN4IQD2ys7mh5dhA6xyI7RdVIdig
+kuC1Ru0D7+46hUlBm4zeRSft54Hag==
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
