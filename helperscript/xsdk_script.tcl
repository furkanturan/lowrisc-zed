#!/usr/bin/tclsh
connect -url tcp:127.0.0.1:3121
source ./helperscript/ps7_init.tcl
targets -set -filter {name =~"APU" && jtag_cable_name =~ "Digilent Zed 210248687092"} -index 0
rst -system
ps7_init
ps7_post_config