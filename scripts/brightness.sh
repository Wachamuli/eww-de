#!/bin/bash

# last_brightness=$(get_current_brightness)

while true; do
  current_brightness=$(brightnessctl g)

  if [ "$current_brightness" != "$last_brightness" ]; then
    echo $((current_brightness * 100 / 96000))
    last_brightness="$current_brightness"
  fi
done
