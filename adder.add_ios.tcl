# This is design dependent code to put IOs on particular sides of the block
proc get_port_names { port_collection } {
global synopsys_program_name
    if [ info exists synopsys_program_name ] {
       return [join [ get_attribute $port_collection full_name ] ]
    } else {
        return [ get_db $port_collection .name ]
    }
}

#foreach i { a b cin clock reset}  {
#  insert_io  $i l 
#}
#foreach i { sum cout } {
#  insert_io  $i r 
#}
#foreach i { a b }  {
#  insert_io  $i t 
#}
#foreach i { clock reset }  {
#  insert_io  $i b 
#}
