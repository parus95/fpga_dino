#
# Vivado (TM) v2015.3 (64-bit)
#
# proj_init.tcl: Tcl script for re-creating project 'soc'
#
# Generated by Vivado on Sat Dec 15 21:41:03 MSK 2018
# IP Build 1367837 on Mon Sep 28 08:56:14 MDT 2015
#
# This file contains the Vivado Tcl commands for re-creating the project to the state*
# when this script was generated. In order to re-create the project, please source this
# file in the Vivado Tcl Shell.
#
# * Note that the runs in the created project will be configured the same way as the
#   original project, however they will not be launched automatically. To regenerate the
#   run results please launch the synthesis/implementation runs as needed.
#
#*****************************************************************************************
# NOTE: In order to use this script for source control purposes, please make sure that the
#       following files are added to the source control system:-
#
# 1. This project restoration tcl script (proj_init.tcl) that was generated.
#
# 2. The following source(s) files that were local or imported into the original project.
#    (Please see the '$orig_proj_dir' and '$origin_dir' variable setting below at the start of the script)
#
#    <none>
#
# 3. The following remote source files that were added to the original project:-
#
#    "/home/parus/git/fpga_dino/hello_worlds/fpga/soc/soc.srcs/sources_1/imports/picorv32/picosoc/spimemio.v"
#    "/home/parus/git/fpga_dino/hello_worlds/fpga/soc/soc.srcs/sources_1/imports/picorv32/picosoc/simpleuart.v"
#    "/home/parus/git/fpga_dino/hello_worlds/fpga/soc/soc.srcs/sources_1/imports/picorv32/picosoc/picosoc.v"
#    "/home/parus/git/fpga_dino/hello_worlds/fpga/soc/soc.srcs/sources_1/imports/picorv32/picorv32.v"
#    "/home/parus/git/fpga_dino/hello_worlds/fpga/soc/soc.srcs/sources_1/new/main_wrapper.v"
#    "/home/parus/git/fpga_dino/hello_worlds/fpga/soc/soc.srcs/sources_1/new/rst_spike.v"
#    "/home/parus/git/fpga_dino/hello_worlds/fpga/soc/soc.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0.xci"
#    "/home/parus/git/fpga_dino/hello_worlds/fpga/soc/soc.srcs/constrs_1/imports/ledblink/7A50T_Master_XDC_PCB_Rev_A_v1_0.xdc"
#    "/home/parus/git/fpga_dino/hello_worlds/fpga/soc/soc.srcs/constrs_1/new/constraints2.xdc"
#
#*****************************************************************************************

# Set the reference directory for source file relative paths (by default the value is script directory path)
set origin_dir "."

# Use origin directory path location variable, if specified in the tcl shell
if { [info exists ::origin_dir_loc] } {
  set origin_dir $::origin_dir_loc
}

variable script_file
set script_file "proj_init.tcl"

# Help information for this script
proc help {} {
  variable script_file
  puts "\nDescription:"
  puts "Recreate a Vivado project from this script. The created project will be"
  puts "functionally equivalent to the original project for which this script was"
  puts "generated. The script contains commands for creating a project, filesets,"
  puts "runs, adding/importing sources and setting properties on various objects.\n"
  puts "Syntax:"
  puts "$script_file"
  puts "$script_file -tclargs \[--origin_dir <path>\]"
  puts "$script_file -tclargs \[--help\]\n"
  puts "Usage:"
  puts "Name                   Description"
  puts "-------------------------------------------------------------------------"
  puts "\[--origin_dir <path>\]  Determine source file paths wrt this path. Default"
  puts "                       origin_dir path value is \".\", otherwise, the value"
  puts "                       that was set with the \"-paths_relative_to\" switch"
  puts "                       when this script was generated.\n"
  puts "\[--help\]               Print help information for this script"
  puts "-------------------------------------------------------------------------\n"
  exit 0
}

if { $::argc > 0 } {
  for {set i 0} {$i < [llength $::argc]} {incr i} {
    set option [string trim [lindex $::argv $i]]
    switch -regexp -- $option {
      "--origin_dir" { incr i; set origin_dir [lindex $::argv $i] }
      "--help"       { help }
      default {
        if { [regexp {^-} $option] } {
          puts "ERROR: Unknown option '$option' specified, please type '$script_file -tclargs --help' for usage info.\n"
          return 1
        }
      }
    }
  }
}

# Set the directory path for the original project from where this script was exported
set orig_proj_dir "[file normalize "$origin_dir/"]"

# Create project
create_project soc ./soc

# Set the directory path for the new project
set proj_dir [get_property directory [current_project]]

# Set project properties
set obj [get_projects soc]
set_property "default_lib" "xil_defaultlib" $obj
set_property "part" "xc7a50tftg256-1" $obj
set_property "sim.ip.auto_export_scripts" "1" $obj
set_property "simulator_language" "Mixed" $obj
set_property "source_mgmt_mode" "DisplayOnly" $obj

# Create 'sources_1' fileset (if not found)
if {[string equal [get_filesets -quiet sources_1] ""]} {
  create_fileset -srcset sources_1
}

# Set 'sources_1' fileset object
set obj [get_filesets sources_1]
set files [list \
 "[file normalize "$origin_dir/soc.srcs/sources_1/imports/picorv32/picosoc/spimemio.v"]"\
 "[file normalize "$origin_dir/soc.srcs/sources_1/imports/picorv32/picosoc/simpleuart.v"]"\
 "[file normalize "$origin_dir/soc.srcs/sources_1/imports/picorv32/picosoc/picosoc.v"]"\
 "[file normalize "$origin_dir/soc.srcs/sources_1/imports/picorv32/picorv32.v"]"\
 "[file normalize "$origin_dir/soc.srcs/sources_1/new/main_wrapper.v"]"\
 "[file normalize "$origin_dir/soc.srcs/sources_1/new/rst_spike.v"]"\
]
add_files -norecurse -fileset $obj $files

# Set 'sources_1' fileset file properties for remote files
# None

# Set 'sources_1' fileset file properties for local files
# None

# Set 'sources_1' fileset properties
set obj [get_filesets sources_1]
set_property "top" "main_wrapper" $obj

# Set 'sources_1' fileset object
set obj [get_filesets sources_1]
set files [list \
 "[file normalize "$origin_dir/soc.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0.xci"]"\
]
add_files -norecurse -fileset $obj $files

# Set 'sources_1' fileset file properties for remote files
# None

# Set 'sources_1' fileset file properties for local files
# None

# Create 'constrs_1' fileset (if not found)
if {[string equal [get_filesets -quiet constrs_1] ""]} {
  create_fileset -constrset constrs_1
}

# Set 'constrs_1' fileset object
set obj [get_filesets constrs_1]

# Add/Import constrs file and set constrs file properties
set file "[file normalize "$origin_dir/soc.srcs/constrs_1/imports/ledblink/7A50T_Master_XDC_PCB_Rev_A_v1_0.xdc"]"
set file_added [add_files -norecurse -fileset $obj $file]
set file "$origin_dir/soc.srcs/constrs_1/imports/ledblink/7A50T_Master_XDC_PCB_Rev_A_v1_0.xdc"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets constrs_1] [list "*$file"]]
set_property "file_type" "XDC" $file_obj

# Add/Import constrs file and set constrs file properties
set file "[file normalize "$origin_dir/soc.srcs/constrs_1/new/constraints2.xdc"]"
set file_added [add_files -norecurse -fileset $obj $file]
set file "$origin_dir/soc.srcs/constrs_1/new/constraints2.xdc"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets constrs_1] [list "*$file"]]
set_property "file_type" "XDC" $file_obj

# Set 'constrs_1' fileset properties
set obj [get_filesets constrs_1]
set_property "target_constrs_file" "$orig_proj_dir/soc.srcs/constrs_1/new/constraints2.xdc" $obj

# Create 'sim_1' fileset (if not found)
if {[string equal [get_filesets -quiet sim_1] ""]} {
  create_fileset -simset sim_1
}

# Set 'sim_1' fileset object
set obj [get_filesets sim_1]
# Empty (no sources present)

# Set 'sim_1' fileset properties
set obj [get_filesets sim_1]
set_property "top" "picosoc" $obj
set_property "xelab.nosort" "1" $obj
set_property "xelab.unifast" "" $obj

# Create 'synth_1' run (if not found)
if {[string equal [get_runs -quiet synth_1] ""]} {
  create_run -name synth_1 -part xc7a50tftg256-1 -flow {Vivado Synthesis 2015} -strategy "Vivado Synthesis Defaults" -constrset constrs_1
} else {
  set_property strategy "Vivado Synthesis Defaults" [get_runs synth_1]
  set_property flow "Vivado Synthesis 2015" [get_runs synth_1]
}
set obj [get_runs synth_1]
set_property "part" "xc7a50tftg256-1" $obj

# set the current synth run
current_run -synthesis [get_runs synth_1]

# Create 'impl_1' run (if not found)
if {[string equal [get_runs -quiet impl_1] ""]} {
  create_run -name impl_1 -part xc7a50tftg256-1 -flow {Vivado Implementation 2015} -strategy "Vivado Implementation Defaults" -constrset constrs_1 -parent_run synth_1
} else {
  set_property strategy "Vivado Implementation Defaults" [get_runs impl_1]
  set_property flow "Vivado Implementation 2015" [get_runs impl_1]
}
set obj [get_runs impl_1]
set_property "part" "xc7a50tftg256-1" $obj
set_property "steps.write_bitstream.args.readback_file" "0" $obj
set_property "steps.write_bitstream.args.verbose" "0" $obj

# set the current impl run
current_run -implementation [get_runs impl_1]

puts "INFO: Project created:soc"
