#!/bin/bash

SERVICE="sshd"
LOG="/home/red/Github/Linux-Admin/service-monitor/logs/service.log"

DATE=$(date)

STATUS=$(systemctl is-active $SERVICE)

if [ "$STATUS" != "active" ]; then
    echo "[$DATE] $SERVICE is DOWN. Restarting..." >> $LOG
    systemctl restart $SERVICE

    if [ $? -eq 0 ]; then
        echo "[$DATE] $SERVICE restarted successfully" >> $LOG
    else
        echo "[$DATE] FAILED to restart $SERVICE" >> $LOG
    fi
else
    echo "[$DATE] $SERVICE is running normally" >> $LOG
fi
