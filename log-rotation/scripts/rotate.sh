#!/bin/bash

LOG_DIR="/home/red/Github/Linux-Admin/log-rotation/logs"
ARCHIVE_DIR="/home/red/Github/Linux-Admin/log-rotation/archive"
DATE=$(date +"%Y-%m-%d_%H-%M-%S")

LOG_FILE="$LOG_DIR/app.log"

# Check if log exists
if [ -f "$LOG_FILE" ]; then

    ARCHIVE_FILE="$ARCHIVE_DIR/app_$DATE.log"

    # Move log to archive
    mv "$LOG_FILE" "$ARCHIVE_FILE"

    # Compress it
    gzip "$ARCHIVE_FILE"

    # Create new empty log
    touch "$LOG_FILE"

    echo "Log rotated and compressed: $ARCHIVE_FILE.gz"

else
    echo "No log file found"
fi

# Delete logs older than 7 days
find "$ARCHIVE_DIR" -type f -name "*.gz" -mtime +7 -exec rm -f {} \;

echo "Old logs cleaned (older than 7 days)"
