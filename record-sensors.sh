#!/usr/bin/env bash

CWD="."

# XXX: a less terrible hardcoded solution?
if [ -z "$1" ]; then
    export DISPLAY=:0
    export XAUTHORITY=/run/user/1000/gdm/Xauthority
fi

function psensor_window_id() {
    # https://stackoverflow.com/a/252911/1634249
    local WINDOW=$(xwininfo -tree -root | grep -i "psensor - temperature monitor")
    if [ $? -ne 0 ]; then
        return 1
    fi
    # ifs string splitting on whitespace
    local WINDOW_ARGS=( $WINDOW )
    echo ${WINDOW_ARGS[0]}
}

while true; do
    WINDOW_ID=$( psensor_window_id )
    if [[ -z $WINDOW_ID ]]; then
        echo "no window found matching 'pSensor - Temperature Monitor', waiting for window..."
        sleep 2
        continue
    fi
    echo "import -window $WINDOW_ID sensors.png"
    import -window $WINDOW_ID "${CWD}/sensors.png"
    sleep 2
done

echo "abnormal exit"
exit 3
