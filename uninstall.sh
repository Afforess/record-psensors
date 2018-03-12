#!/usr/bin/env bash

echo "disabling and stopping systemd service"
sudo systemctl stop sensors.service
sudo rm -f /etc/systemd/system/record-psensors.service
echo "deleting /usr/local/bin/record-sensors.sh"
sudo rm -f /usr/local/bin/record-sensors.sh
echo "uninstall completed."

