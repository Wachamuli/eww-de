#!/bin/bash

wifi_scan=$(nmcli -t -f SSID,RATE,SIGNAL,SECURITY dev wifi)

json_output='['

while IFS= read -r line; do
    # Split the line into fields
    IFS=':' read -r ssid rate signal security <<< "$line"

    if (( signal < 10 )); then
        continue
    fi

    ssid=$(echo "$ssid" | sed 's/[\\]//g')
    json_output+='{"ssid":"'"$ssid"'","rate":"'"$rate"'","signal":"'"$signal"'","security":"'"$security"'"},'

done <<< "$wifi_scan"

json_output="${json_output%,}]"

echo "$json_output"
