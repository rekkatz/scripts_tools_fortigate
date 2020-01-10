#!/usr/bin/expect -f

# Variables Client/IP
set IP [lindex $argv 0];
set timeout 2;

# Log file threat intelligent
log_file /home/cristian/logs/search.log

# Execution command to client Fortigate CLI
spawn ssh -o "StrictHostKeyChecking=no" -o "UserKnownHostsFile=~/.ssh/known_hosts" admin@$192.168.10.100 -p 22
expect "Enter password: "
send "admin\r" #Password
expect "fortinet_name"
send "show firewall address | grep BL_$IP\r"
expect ")"
send "exit\r"
expect ")"