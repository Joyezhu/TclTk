# $Id: omsini.tcl,v 1.2 2002/11/02 06:31:55 thomas Exp $
# Copyright 2000-2002 Front Office Technology (HK) Co. Ltd.

############################################################################
# Constants
#######################################################################
set winLocation "oms.ini"
array set iniAttribute ""

proc omsIni {section} {

	global iniAttribute 
	global winLocation
	global env

	set location "oms.ini"
  
	if { [catch { open $location r } iniSource] } {
		set location $winLocation
		if { [catch { open $location r } iniSource] } {
			puts stderr "Could not open $location for reading\n"
			return
		}
	}
	while { [eof $iniSource] == 0} {
		
		gets $iniSource line
		if {![regexp {^ *\[.+\] *$} $line ]} {
			continue
		}
		# At this point, the line contain the section
		regsub " +$" $line {} line
		regsub "^ +" $line {} line
		if { $line == "\[$section\]" } {
			
			while { [eof $iniSource] == 0} {
				
				gets $iniSource line
				regsub " +$" $line {} line
				regsub "^ +" $line {} line
				
				if {![regexp {\[.+\]} $line]} {
					
					if {[regexp {.*=.*} $line]} {
						
						set pair [split $line "="]
						set len [llength $pair]
						
						regsub " +$" [lindex $pair 0] {} attr
						
						if {$len >2} {
							set value [lindex $pair 1]
							for {set i 2} {$i<$len} {incr i} {
								append value " = [lindex $pair $i]" 
							}
						
						} else {
							regsub "^ +" [lindex $pair 1] {} value
						}						
						
						set ss [string first "%" $value]
						set ee [string last "%" $value]
						
						if { $ss >= 0 && $ee > $ss} {
						set ss [expr $ss + 1]
						set ee [expr $ee - 1]
						set evar [string range $value $ss $ee]
					
						if { [regsub "%\[0-9a-zA-Z\]+%" $value $env($evar) var2] > 0 } {
								set value $var2
							}
						}
						
						regsub " +$" $value {} value
						set iniAttribute($attr) $value
					}
				
				} else {
					break
				}
			}
		}
	}
	
	close $iniSource
}

