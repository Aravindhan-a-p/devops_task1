#! /usr/bin/bash
uptime=$(uptime -p) #uptime of computer
disc_usage=$(df -h) # disc usage
memory_usage=$(free) #memory usage
utilisation=$(top | head -n 10) #utilisation
expensive_process=$(ps --sort=-pcpu | head -n 10) #expensive processes(first 10 lines )
tcp_port=$(sudo ss -tuln | head -n 10) # tcp ports(first 10 lines as lot of processes)
current_connect=$(sudo ss -an | head -n 20) # current connections(first 10 lines as lot of processes)
running_process=$(ps) # running processes


# transferring the above data to log file
echo -e "Uptime:${uptime}" >> ./comp_log.txt
echo -e "Disc Usage :${disc_usage}"  >> ./comp_log.txt
echo -e "Memory Usage :${memory_usage}" >>  ./comp_log.txt
echo -e "Utilisation:${utilisation}" >> ./comp_log.txt
echo -e "Expensive processes : ${expensive_process}" >> ./comp_log.txt
echo -e "Open TCP Ports:${tcp_port}" >> ./comp_log.txt
echo -e "Current Connections:${current_connect}" >> ./comp_log.txt
echo -e " Processes :${running_process}" >> ./comp_log.txt



