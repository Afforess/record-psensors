#!/usr/bin/env bash

# https://stackoverflow.com/a/252911/1634249
WINDOW=$(xwininfo -tree -root | grep -i "psensor - temperature monitor")
if [ $? -ne 0 ]; then
    echo "no window matching 'pSensor - Temperature Monitor'"
    exit 2
fi
# ifs string splitting on whitespace
WINDOW_ARGS=( $WINDOW )
WINDOW_ID=${WINDOW_ARGS[0]}

while true; do
    echo "import -window $WINDOW_ID sensors.png"
    import -window $WINDOW_ID sensors.png
    sleep 2
done
