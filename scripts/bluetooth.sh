#!/bin/bash
if bluetoothctl show | grep -q 'Powered: yes'; then
    state="on"
else
    state="off"
fi

echo "{\"state\": \"${state}\"}"
