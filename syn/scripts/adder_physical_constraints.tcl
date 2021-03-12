remove_die_area
create_die_area -coordinate {0 0 1200 1200}

create_placement_blockage -name def_obstuction_hard -bbox { 358 355 407 433 }
create_placement_blockage -name def_obstuction_soft -bbox { 538 349 670 425 } -type soft
create_placement_blockage -name def_obstuction_partial -bbox { 731 496 781 611 } -type partial -blocked_percentage 70

create_wiring_keepouts -name def_wiring_keepouts -layer M4 -coordinate { 368 768 514 835 }

create_bounds -coordinate {771 735 790 870} -name mb_soft -color cyan dff_a

