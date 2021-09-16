#!/bin/bash

# Output color codes
# https://en.wikipedia.org/wiki/ANSI_escape_code

declare -r COLOR_NC='\033[0m'
declare -r COLOR_RED='\033[0;31m'
declare -r COLOR_GREEN='\033[0;32m'
declare -r COLOR_LIGHT_GREEN='\033[1;32m'
declare -r COLOR_YELLOW='\033[1;33m'
declare -r COLOR_LIGHT_YELLOW='\033[0;33m'
declare -r COLOR_BLUE='\033[0;34m'
declare -r COLOR_LIGHT_BLUE='\033[1;34m'

# Stop apache
service apache2 stop;

# Step down from sudo to uvdesk
/usr/local/bin/gosu uvdesk "$@"

# Start supervisord and services
/usr/bin/supervisord -n -c /etc/supervisord.conf
