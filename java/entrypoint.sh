#!/bin/sh
cd /home/container || exit 1

# ========== Configure colors ==========
CYAN='\033[0;36m'
YELLOW='\033[1;33m'
RESET_COLOR='\033[0m'

# ========== Print System Info ==========
echo "${YELLOW}=== SYSTEM INFO ===${RESET_COLOR}"
echo "OS: $(uname -o)"
echo "Kernel: $(uname -r)"
echo "Arch: $(uname -m)"
echo "CPU Info: $(grep -m 1 'model name' /proc/cpuinfo | cut -d ':' -f2- | xargs)"
echo "Java Version:"
java -version
echo "IP Address: $(hostname -I | awk '{print $1}')"

# Try getting MAC Address (HWID-like)
echo "MAC Address (eth0): $(ip link show eth0 | awk '/ether/ {print $2}')"

# ========== Set environment variable for Docker Internal IP ==========
INTERNAL_IP=$(ip route get 1 | awk '{print $(NF-2);exit}')
export INTERNAL_IP

# ========== Replace Startup Variables ==========
MODIFIED_STARTUP=$(printf '%s\n' "$STARTUP" | sed -e 's/{{/${/g' -e 's/}}/}/g')
printf '%sSTARTUP /home/container: %s%s\n' "$CYAN" "$MODIFIED_STARTUP" "$RESET_COLOR"

# ========== Run the Server ==========
eval "$MODIFIED_STARTUP"
