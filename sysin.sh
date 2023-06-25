#! /usr/bin/bash

    dp=$(lscpu | grep 'Model name:')
    echo "Desktop Processor: ${dp}"\ >> system_info.txt
    
    sk=$(hostnamectl | grep 'Kernal\n')
    echo "System Kernel: ${sk}" >> system_info.txt
    
    is=$(dpkg-query -f '${binary:Package}\n' -W | head -n 5 | tail -n -4)
    echo "Installed Software: ${is}" >> system_info.txt
    
    os=$(lsb_release -d | cut -f2- )
    echo "Operating System Version: ${os}" >> system_info.txt
    
     dm=$(free -h | grep 'Mem:\n' )
    echo "Desktop Memory: ${dm}" >> system_info.txt
    
    sno=$(sudo dmidecode -s system-serial-number)
    echo "Serial Number: ${sno}" >> system_info.txt
     
    sip=$(hostname -I )
    echo "System IP: ${sip}" >> system_info.txt
   

