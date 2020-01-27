#!/usr/bin/expect -f

# Variables definidas
set PATH [lindex $argv 0];
set DATE [exec date +%F_%T];
set CONFIG "sys_config"
set timeout 2;

# Log file
log_file <PATH_SAVE_LOG>

# Execution command to client Fortigate CLI
spawn scp -o "StrictHostKeyChecking=no" -o "UserKnownHostsFile=~/.ssh/known_hosts" -P 22 <USER@IP>:$CONFIG $PATH/backup\_$DATE.conf
expect "password: "
send "password\r"
expect eof
