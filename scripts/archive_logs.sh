
#!/bin/bash

LOG_DIR="$HOME/multi-env-devops/logs"
ARCHIVE_DIR="$LOG_DIR/archive"

# Make sure archive directory exists
mkdir -p "$ARCHIVE_DIR"

# Create archive filename with date
ARCHIVE_NAME="logs_$(date +%F).tar.gz"

# Compress log files
tar -czf "$ARCHIVE_DIR/$ARCHIVE_NAME" -C "$LOG_DIR" .

# Remove archives older than 7 days
find "$ARCHIVE_DIR" -type f -name 'logs_*.tar.gz' -mtime +7 -exec rm {} \;

echo "✅ Archived logs and cleaned up old archives."
