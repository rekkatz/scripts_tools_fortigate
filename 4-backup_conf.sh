#!/usr/bin/expect -f

# Variables definidas
set PATH [lindex $argv 0];
set DATE [exec date +%F_%T];
set CONFIG "sys_config"
set timeout 2;

# Log file
log_file <Log_path>

# Execution command to client Fortigate CLI
spawn scp -o "StrictHostKeyChecking=no" -o "UserKnownHostsFile=~/.ssh/known_hosts" -P 22 user@ip:$CONFIG $PATH/backup\_$DATE.conf
expect "Enter password: "
send "admin\r"
expect eof

