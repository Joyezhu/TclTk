
# initialize
source omsini.tcl
source sendemail.tcl
package require tclodbc


# set dum file

set sendemail ""
set sender ""
set receiver ""
set emailhost ""
set subject ""

array set iniAttribute ""
# Send email parameters
omsIni "OMS_Email" 
if {[info exists iniAttribute(sendemail)]} {
	set sendemail $iniAttribute(sendemail)
} else {
	set sendemail 0
}
if {[info exists iniAttribute(sender)]} {
	set sender $iniAttribute(sender)
} else {
	set sender "abc@ebrokernet.com"
}
if {[info exists iniAttribute(receiver)]} {
	set receiver $iniAttribute(receiver)
} else {
	set receiver "abc@ebrokernet.com"
}
if {[info exists iniAttribute(emailhost)]} {
	set emailhost $iniAttribute(emailhost)
} else {
	set emailhost "192.168.1.21"
}
if {[info exists iniAttribute(subject)]} {
	set subject $iniAttribute(subject)
} else {
	set subject "\[Auto Check\] Check result"
}
# data base paras
omsIni "OMS_DATABASE"
if {[info exists iniAttribute(DSN_source)]} {
	set DSN_source $iniAttribute(DSN_source)
} else {
	set DSN_source omsdata
}
if {[info exists iniAttribute(DSN_user)]} {
	set DSN_user $iniAttribute(DSN_user)
} else {
	set DSN_user sa
}
if {[info exists iniAttribute(DSN_password)]} {
	set DSN_password $iniAttribute(DSN_password)
} else {
	set DSN_password ""
}

# SQL paras
omsIni "SQL"
if {[info exists iniAttribute(sql)]} {
	set sql $iniAttribute(sql)
} else {
	set sql ""
}


database db $DSN_source $DSN_user $DSN_password
set body [db $sql]

# send mail
if {$sendemail} {

	send_message $sender $emailhost  $subject $body $receiver
}

db disconnect



