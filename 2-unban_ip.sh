#!/usr/bin/expect -f

# Variables arguments
set IP [lindex $argv 0];
set timeout 2;

# Log file threat intelligent
log_user 0
log_file <PATH_SAVE_LOG>

# Execution command to client Fortigate CLI
puts "############################################"
puts "#### Eliminando IP del grupo Blacklist #####"
puts "############################################"
spawn ssh -o "StrictHostKeyChecking=no" -o "UserKnownHostsFile=~/.ssh/known_hosts" USER@IP -p 22
expect "password: "
send "password\r"
expect "\#"
send "config firewall addrgrp\r"
expect "(addrgrp)"
send "edit BLACKLIST\r"
expect "(BLACKLIST)"
send "unselect member BL_$IP\r"
expect {
	"entry not found" { 
		puts "\n++ ERROR - La dirección IP $IP no se encuentra en el grupo BLACKLIST\n"
		exit
		}
}
send "end\r"
expect "#"
send "config firewall address\r"
expect "(address)"
send "delete BL_$IP\r"
expect "(address)"
send "end\r"
expect "#"
send "exit\r"
expect "closed"
puts "\n++ OK - Dirección IP $IP eliminada del grupo BLACKLIST\n"
