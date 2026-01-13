status=$(systemctl is-active geoclue)

echo "{ \"state\": \"${status}\" }"
