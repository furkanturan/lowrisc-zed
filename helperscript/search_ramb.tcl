set origin_dir "."
set project_name [lindex $argv 0]
set orig_proj_dir [file normalize $origin_dir/$project_name]

# open project
open_project $orig_proj_dir/$project_name.xpr

# open implemented design
open_run impl_1

# search for all RAMB blocks

set myInsts [get_cells -hier -filter {PRIMITIVE_TYPE =~ BMEM.*.*}]

foreach memInst [lsort -increasing $myInsts] {
    #puts $memInst
    #this is the property we need
    #LOC                             site     false      RAMB36_X6Y39
    #report_property $memInst LOC
    set loc [get_property LOC $memInst]
    #puts $loc
    puts "$memInst BUSWIDTH PLACED = $loc"
}