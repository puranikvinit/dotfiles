#!/bin/bash

# # Function to check if systemd-resolved is active
# function is_systemd_resolved_active() {
#     systemctl is-active --quiet systemd-resolved
# }
#
# # Wait for systemd-resolved to be active
# while ! is_systemd_resolved_active; do
#     echo "Waiting for systemd-resolved to become active..."
#     sleep 5
# done
#
# echo "systemd-resolved is active"
#
# # Define the IP address and port
# IP="127.0.0.53"
# PORT="53"
#
# # Wait for the port to become active
# while ! nc -zv $IP $PORT 2>&1 | grep -q 'Connected'; do
#     echo "Waiting for port $PORT on $IP to become active..."
#     sleep 5
# done
#
# echo "Port $PORT on $IP is active"

# Run the rclone command
umount -l /mnt/icloud
rclone mount icloud-drive:/ /mnt/icloud --vfs-cache-mode=full --config=/home/kvp_933/.config/rclone/rclone.conf
