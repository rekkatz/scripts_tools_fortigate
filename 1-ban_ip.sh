#!/usr/bin/expect -f

# Variables Client/IP
set IP [lindex $argv 0];
set COM [lindex $argv 1];
set timeout 2;

# Logs
log_user 0
log_file -a <PATH_SAVE_LOG>

# Execution command to client Fortigate CLI
puts "############################################"
puts "#### Añadiendo IP a grupo de Blacklist #####"
puts "############################################"
spawn ssh -o "StrictHostKeyChecking=no" -o "UserKnownHostsFile=~/.ssh/known_hosts" USER@IP -p 22
expect "password: "
send "password\r"
expect "#"
send "config firewall address\r"
expect "(address)"
send "edit BL_$IP\r"
expect "BL_4IP"
send "set subnet $IP/32\r"
expect {
	"invalid" { 
		puts "\n++ ERROR - La dirección IP $IP no es correcta"
		puts "** Por favor, comprueba que ha sido introducida correctamente\n"
		exit
		}
}
send "set comment \"$COM\"\r"
expect "(BL_$IP)"
send "set color 6\r"
expect "(BL_$IP)"
send "end\r"
expect "#"
send "config firewall addrgrp\r"
expect "(addrgrp)"
send "edit BLACKLIST\r"
expect "(BLACKLIST)"
send "append member BL_$IP\r"
expect "(BLACKLIST)"
send "end\r"
expect "#"
send "exit\r"
expect "closed"
puts "\nOK - Dirección $IP añadida a grupo Blacklist\n"
