vsim -t ns CONEXIONADO 

add wave *

force cp2 1 0, 0 {5 ns} -r 10

force cp2en 1
force ireset 0
run 20
force ireset 1

force reg_rr_adr 10000
force reg_rd_adr 10001

force idc_add 1
force idc_and 0
force idc_eor 0
force idc_neg 0
force idc_or 0


force reg_rd_hb_in 00010111  
force reg_rd_in 00010001
run 50


force reg_rr_adr 10011
force reg_rd_adr 10100

force idc_add 0
force idc_and 0
force idc_eor 0
force idc_neg 0
force idc_or 1



force reg_rd_hb_in 00100011
force reg_rd_in 00101000
run 50



