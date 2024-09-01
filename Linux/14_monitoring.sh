#!/bin/bash

LOG_FILE="/var/log/cpu_usage_monitor.log"

THRESHOLD=75

CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{printf "%.0f", 100 - $1}')

if [ "$CPU_USAGE" -gt "$THRESHOLD" ]; then
    echo "$(date): Penggunaan CPU tinggi terdeteksi: ${CPU_USAGE}% - Melebihi batas ${THRESHOLD}%" >> $LOG_FILE
fi
