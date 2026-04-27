#!/bin/bash

LOG="/home/red/Github/Linux-Admin/system-monitor/logs/system.log"

echo "==== System Check $(date) ====" >> $LOG

# CPU
CPU=$(top -bn1 | grep "Cpu" | awk '{print 100 - $8}')

# Memory
MEM=$(free -m | awk 'NR==2{printf "%.2f", $3/$2 * 100}')

# Disk
DISK=$(df -h / | awk 'NR==2{print $5}' | sed 's/%//')

echo "CPU Usage: $CPU%" >> $LOG
echo "Memory Usage: $MEM%" >> $LOG
echo "Disk Usage: $DISK%" >> $LOG

# Alerts
CPU_INT=${CPU%.*}
MEM_INT=${MEM%.*}

if [ "$CPU_INT" -gt 80 ]; then
    echo "ALERT: High CPU Usage!" >> $LOG
fi

if [ "$MEM_INT" -gt 80 ]; then
    echo "ALERT: High Memory Usage!" >> $LOG
fi

if [ "$DISK" -gt 80 ]; then
    echo "ALERT: Disk Almost Full!" >> $LOG
fi

echo "" >> $LOG 
echo "Script Executed Successfully"
