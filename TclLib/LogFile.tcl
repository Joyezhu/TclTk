proc TimeStamp {} {

	return [clock format [clock seconds] -format "\[%Y-%m-%d %T\]"]
}

proc OpenLogFile { FilePath } {
	
	if {[file exists $FilePath]} {
		
		catch {set LogFileID [open $FilePath a+]}
	}
	
}

proc WriteLogMsg {FileID LogMsg} {

	if {$FileID !=""} {
		puts $FileID "[TimeStamp] $LogMsg"
	}
	
}

proc FlushLogFile {} {
	
}

proc CloseLogFile { FileID} {

	if {$FileID !=""} {
		close $FileID
	}
}