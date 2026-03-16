#!/bin/sh
cd /home/container || exit 1

# ========== Configure colors ==========
CYAN='\033[0;36m'
YELLOW='\033[1;33m'
GREEN='\033[0;32m'
RED='\033[0;31m'
RESET_COLOR='\033[0m'

trim_whitespace() {
    printf '%s' "$1" | tr -d '[:space:]'
}

read_first_available() {
    for file in "$@"; do
        [ -r "$file" ] || continue

        value=$(tr -d '[:space:]' < "$file")
        [ -n "$value" ] || continue

        printf '%s' "$value"
        return 0
    done

    return 1
}

get_primary_mac() {
    mac=$(ip link show eth0 2>/dev/null | awk '/ether/ {print $2; exit}')

    if [ -z "$mac" ]; then
        mac=$(ip link 2>/dev/null | awk '/ether/ {print $2; exit}')
    fi

    printf '%s' "$mac"
}

hash_string() {
    if command -v sha256sum >/dev/null 2>&1; then
        printf '%s' "$1" | sha256sum | awk '{print $1}'
        return 0
    fi

    if command -v md5sum >/dev/null 2>&1; then
        printf '%s' "$1" | md5sum | awk '{print $1}'
        return 0
    fi

    if command -v openssl >/dev/null 2>&1; then
        printf '%s' "$1" | openssl dgst -sha256 | awk '{print $NF}'
        return 0
    fi

    printf '%s' "$1"
}

build_hwid() {
    machine_id=$(read_first_available /etc/machine-id /var/lib/dbus/machine-id /sys/class/dmi/id/product_uuid)
    primary_mac=$(get_primary_mac)
    host_name=${HOSTNAME:-$(hostname 2>/dev/null)}

    hwid_seed=$(printf '%s|%s|%s' "$machine_id" "$primary_mac" "$host_name")
    hash_string "$hwid_seed"
}

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
echo "Primary MAC Address: $(get_primary_mac)"

# ========== Validate HWID ==========
CURRENT_HWID=$(build_hwid)
EXPECTED_HWID=$(trim_whitespace "${EXPECTED_HWID:-${HWID:-}}")
REQUIRE_HWID_CHECK=${REQUIRE_HWID_CHECK:-0}

echo "Computed HWID: $CURRENT_HWID"

if [ "$REQUIRE_HWID_CHECK" = "1" ] && [ -z "$EXPECTED_HWID" ]; then
    echo "${RED}HWID check is enabled, but EXPECTED_HWID is not set.${RESET_COLOR}"
    exit 1
fi

if [ -n "$EXPECTED_HWID" ]; then
    if [ "$CURRENT_HWID" != "$EXPECTED_HWID" ]; then
        echo "${RED}HWID mismatch. Refusing to start.${RESET_COLOR}"
        echo "Expected HWID: $EXPECTED_HWID"
        echo "Actual HWID:   $CURRENT_HWID"
        exit 1
    fi

    echo "${GREEN}HWID check passed.${RESET_COLOR}"
fi

# ========== Set environment variable for Docker Internal IP ==========
INTERNAL_IP=$(ip route get 1 | awk '{print $(NF-2);exit}')
export INTERNAL_IP

# ========== Replace Startup Variables ==========
MODIFIED_STARTUP=$(printf '%s\n' "$STARTUP" | sed -e 's/{{/${/g' -e 's/}}/}/g')
printf '%sSTARTUP /home/container: %s%s\n' "$CYAN" "$MODIFIED_STARTUP" "$RESET_COLOR"

# ========== Run the Server ==========
eval "$MODIFIED_STARTUP"
