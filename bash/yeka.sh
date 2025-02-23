#!/bin/bash

# Fully functional USB-triggered shutdown script for training
# WARNING: This WILL shut down a Linux system if run with sudo and a USB is inserted

# Log file to track execution
LOG_FILE="/tmp/usb_shutdown.log"
echo "$(date): Script initiated" >> "$LOG_FILE"

# Function to detect USB insertion
detect_usb() {
    echo "$(date): Scanning for USB..." >> "$LOG_FILE"
    # Count block devices before
    BEFORE=$(lsblk -l | grep -c '^sd[a-z] ')
    sleep 3  # Wait for device to register
    # Count block devices after
    AFTER=$(lsblk -l | grep -c '^sd[a-z] ')
    if [ "$AFTER" -gt "$BEFORE" ]; then
        echo "$(date): New USB detected" >> "$LOG_FILE"
        return 0  # USB inserted
    else
        echo "$(date): No new USB" >> "$LOG_FILE"
        return 1
    fi
}

# Function to shut down the system
shutdown_system() {
    echo "$(date): Shutting down now..." >> "$LOG_FILE"
    # Sync filesystem and shut down immediately
    sync
    /sbin/shutdown -h now "System shutdown triggered by USB insertion"
}

# Main execution loop
echo "Monitoring for USB insertion..."
while true; do
    if detect_usb; then
        shutdown_system
        exit 0  # Exit after shutdown command is sent
    fi
    sleep 2  # Poll every 2 seconds
done

# To autorun (optional setup, not included here):
# 1. Save as /usr/local/bin/usb_shutdown.sh
# 2. Make executable: chmod +x /usr/local/bin/usb_shutdown.sh
# 3. Add udev rule: /etc/udev/rules.d/99-usb-shutdown.rules
#    ACTION=="add", SUBSYSTEM=="block", KERNEL=="sd[a-z]", RUN+="/usr/local/bin/usb_shutdown.sh"
# 4. Reload udev: udevadm control --reload-rules