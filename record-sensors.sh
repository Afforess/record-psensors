#!/usr/bin/env bash

CWD="."

# XXX: a less terrible hardcoded solution?
if [ -z "$1" ]; then
    export DISPLAY=:0
    export XAUTHORITY=/run/user/1000/gdm/Xauthority
fi
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
    import -window $WINDOW_ID "${CWD}/sensors.png"
    sleep 2
done

echo "abnormal exit"
exit 3
