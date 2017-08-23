transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+/home/camilo/avr_core_v14/rtl/core {/home/camilo/avr_core_v14/rtl/core/reg_file.v}
vlog -vlog01compat -work work +incdir+/home/camilo/avr_core_v14/rtl/core {/home/camilo/avr_core_v14/rtl/core/alu_avr.v}
vcom -93 -work work {/home/camilo/Documentos/Micros/ProyectoUno/CONEXIONADO.vhd}
vcom -93 -work work {/home/camilo/Documentos/Micros/ProyectoUno/StatusRegister.vhd}

