#!/usr/bin/expect -f

# Variables Client/IP
set IP [lindex $argv 0];
set COM [lindex $argv 1];
set timeout 2;

# Log file threat intelligent
log_file <create log file>

# Execution command to client Fortigate CLI
spawn ssh -o "StrictHostKeyChecking=no" -o "UserKnownHostsFile=~/.ssh/known_hosts" user@ip -p 22
expect "Enter password: "
send "password\r"
expect "fortinet_name"
send "config firewall address\r"
expect "fortinet_name (address)"
send "edit BL_$IP\r"
expect ")"
send "set subnet $IP/32\r"
expect ")"
send "set comment \"$COM\"\r"
expect ")"
send "set color 6\r"
expect ")"
send "end\r"
expect "fortinet_name"
send "config firewall addrgrp\r"
expect ")"
send "edit BLACKLIST\r"
expect ")"
send "append member BL_$IP\r"
expect ")"
send "end\r"
expect ")"
send "exit\r"
expect ")"
