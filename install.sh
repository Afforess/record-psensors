#!/usr/bin/env bash

PWD=$(pwd)
EXPR="s/CWD=\".\"/CWD=\"${PWD////\\/}\"/"

echo "creating /usr/local/bin if it does not exist"
sudo mkdir -p /usr/local/bin
echo "copying ./record-sensors.sh to /usr/local/bin/record-sensors.sh"
sudo cp -p ./record-sensors.sh /usr/local/bin/record-sensors.sh
sudo sed -i $EXPR /usr/local/bin/record-sensors.sh
echo "creating systemd sensors.service"
sudo ln -s $(pwd)/record-psensors.service /etc/systemd/system/record-psensors.service
echo "reloading systemd unit files"
sudo systemctl daemon-reload
echo "enabling & starting systemd sensors.service"
sudo systemctl enable record-psensors.service
sudo systemctl start record-psensors.service
echo "install completed."

