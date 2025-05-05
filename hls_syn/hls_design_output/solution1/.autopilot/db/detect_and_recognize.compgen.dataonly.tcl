# This script segment is generated automatically by AutoPilot

set axilite_register_dict [dict create]
set port_control {
result { 
	dir O
	width 8
	depth 1
	mode ap_vld
	offset 16
	offset_end 23
}
ap_start { }
ap_done { }
ap_ready { }
ap_idle { }
interrupt {
}
}
dict set axilite_register_dict control $port_control


