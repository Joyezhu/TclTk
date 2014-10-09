
set destination E:\PATSDLLDumpLog\
set today [clock format [clock seconds] -format "%Y%m%d%H%M%S"]
set compressexe {E:\PATSDLLDumpLog\Compress.exe}

set zipfile "$destination/PATSDLLDumpLog$today.zip"
set logfiles "$destination/*.log"
puts "$compressexe -add $zipfile $logfiles"

if { [ catch { exec $compressexe -add $zipfile $logfiles} errmsg ] } {
	puts "$errmsg:while zip log files on $today"
}
