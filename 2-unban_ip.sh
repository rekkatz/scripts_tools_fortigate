#!/usr/bin/expect -f

# Variables arguments
set IP [lindex $argv 0];
set timeout 2;

# Log file threat intelligent
log_file /home/cristian/logs/unban.log

# Execution command to client Fortigate CLI
spawn ssh -o "StrictHostKeyChecking=no" -o "UserKnownHostsFile=~/.ssh/known_hosts" user@ip -p 22
expect "Enter password: "
send "password\r"
expect "fortinet_name"
send "config firewall addrgrp\r"
expect "fortinet_name (addrgrp)"
send "edit BLACKLIST\r"
expect ")"
send "unselect member BL_$IP\r"
expect ")"
send "end\r"
expect ")"
send "config firewall address\r"
expect "fortigate_name (address)"
send "delete BL_$IP\r"
expect ")"
send "end\r"
expect ")"
send "exit\r"
expect ")"
