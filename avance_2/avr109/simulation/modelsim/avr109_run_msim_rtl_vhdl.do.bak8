transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+/home/camilo/Documentos/avance_2/avr109 {/home/camilo/Documentos/avance_2/avr109/avr109tx.v}
vlog -vlog01compat -work work +incdir+/home/camilo/Documentos/avance_2/avr109 {/home/camilo/Documentos/avance_2/avr109/avr109rx.v}
vlog -vlog01compat -work work +incdir+/home/camilo/Documentos/avance_2/avr109 {/home/camilo/Documentos/avance_2/avr109/avr109.v}
vcom -93 -work work {/home/camilo/Documentos/avance_2/avr109/conexion.vhd}
vcom -93 -work work {/home/camilo/Documentos/avance_2/avr109/registro.vhd}
vcom -93 -work work {/home/camilo/Documentos/avance_2/avr109/conttime.vhd}
vcom -93 -work work {/home/camilo/Documentos/avance_2/avr109/contbit.vhd}

