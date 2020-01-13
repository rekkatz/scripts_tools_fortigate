# Bash_Scripts_Fortigate
Herramientas bash scripts para firewalls Fortigate.

Algunos bash scripts básicos para trabajar con fortigate a través de línea de comandos, utilizando la shell interactiva "Expect".

1-ban_ip.sh
----------------
Sintaxis: ./1-ban_ip.sh <IP_a_banear> <Comentario>
<br>Ejemplo : ./1-ban_ip.sh 1.1.1.1 "IPS detect"

2-unban_ip.sh
----------------
Sintaxis: ./2-unban_ip.sh <IP_a_eliminar>
<br>Ejemplo : ./2-unban_ip.sh 1.1.1.1

3-search_ip.sh
----------------
Sintaxis: ./3-search_ip.sh <IP_a_buscar>
<br>Ejemplo : ./3-search_ip.sh 1.1.1.1

4-backup_conf.sh
----------------
Sintaxis: ./4-backup_conf.sh backup
<br>
