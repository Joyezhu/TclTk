# ##############
# 
#	send email
#
# ##############
proc send_message {sender email_server subject body recipient} {
	
	package require smtp
	package require mime
	
    set token [mime::initialize -canonical text/plain -string $body ]
    mime::setheader $token From $sender
    mime::setheader $token To $recipient
    mime::setheader $token Subject $subject
    smtp::sendmessage $token -recipients $recipient -servers $email_server -originator $sender -username " " -password " "
    mime::finalize $token
}
