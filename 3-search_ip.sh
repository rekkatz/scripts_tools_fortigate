#!/usr/bin/expect -f

# Variables
set IP [lindex $argv 0];
set timeout 2;

# Log file 
log_user 0
log_file <PATH_SAVE_LOG>

# Execution command to client Fortigate CLI
spawn ssh -o "StrictHostKeyChecking=no" -o "UserKnownHostsFile=~/.ssh/known_hosts" <USER@IP> -p 22
expect "password: "
send "password\r"
expect "#"
send "show firewall addrgrp BLACKLIST | grep -c BL_$IP\r"
expect {
		"0" { puts "\n-- NOT FOUND - La dirección IP $IP NO se encuentra en el grupo BLACKLIST\n" } 
		"1" { puts "\n++ FOUND - La dirección IP $IP se encuentra en el grupo BLACKLIST\n" }
}
send "exit\r"
expect "closed"