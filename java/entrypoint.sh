#!/bin/sh
cd /home/container || exit 1

# Configure colors (sh không có \e, nên dùng printf cho ANSI)
CYAN='\033[0;36m'
RESET_COLOR='\033[0m'

# Print Current Java Version
java -version

# Set environment variable that holds the Internal Docker IP
INTERNAL_IP=$(ip route get 1 | awk '{print $(NF-2);exit}')
export INTERNAL_IP

# Replace Startup Variables (sh không cần echo -e, dùng printf)
# shellcheck disable=SC2086
MODIFIED_STARTUP=$(printf '%s\n' "$STARTUP" | sed -e 's/{{/${/g' -e 's/}}/}/g')
printf '%sSTARTUP /home/container: %s %s\n' "$CYAN" "$MODIFIED_STARTUP" "$RESET_COLOR"

# Run the Server
# shellcheck disable=SC2086
eval "$MODIFIED_STARTUP"
