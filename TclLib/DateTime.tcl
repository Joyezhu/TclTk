proc getDate {} {
	
	return [clock format [clock seconds] -format "%m/%d/%Y"]	
}

proc fileDate {} {
	
	# 20121221
	return [clock format [clock seconds] -format "%Y%m%d"]
}

proc dateTime {} {

	# 12/21/2011 10:50:23 AM
	return [clock format [clock seconds] -format "%Y/%m/%d %T"]	
}

proc dayTime {} {
	
	# 12/21/2011 10:50:23 Wed
	return [clock format [clock seconds] -format "%A"]	
}
proc logTime {} {

	# [2013-08-20 12:05:26]
	return [clock format [clock seconds] -format "\[%Y-%m-%d %T\]"]
}

proc dayTimeWithDay {}
{

	# 09/10/2014 05:00:00 PM
	return [clock format [clock scan] -format "%A"]
}
