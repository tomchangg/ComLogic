transcript off
onbreak {quit -force}
onerror {quit -force}
transcript on

vlib work
vlib activehdl/xil_defaultlib

vmap xil_defaultlib activehdl/xil_defaultlib

vlog -work xil_defaultlib  -v2k5 -l xil_defaultlib \
"../../../../Lab02-IP2SOC.gen/sources_1/ip/Seg7_Dev_0/DisplaySync.v" \
"../../../../Lab02-IP2SOC.gen/sources_1/ip/Seg7_Dev_0/MC_14495.v" \
"../../../../Lab02-IP2SOC.gen/sources_1/ip/Seg7_Dev_0/Seg7_Dev.v" \
"../../../../Lab02-IP2SOC.gen/sources_1/ip/Seg7_Dev_0/sim/Seg7_Dev_0.v" \


vlog -work xil_defaultlib \
"glbl.v"

