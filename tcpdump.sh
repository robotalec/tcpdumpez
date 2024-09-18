#!/bin/bash

# Prompt for file location
read -p "Enter the output file location (default: /tmp/capture.xxxx.pcap): " OUTPUT_FILE
OUTPUT_FILE=${OUTPUT_FILE:-/tmp/capture.xxxx.pcap}

# Prompt for value of -C (file size in MB)
read -p "Enter the value for -C (file size in MB, default: 30): " C_VALUE
C_VALUE=${C_VALUE:-30}

# Prompt for value of -W (number of files)
read -p "Enter the value for -W (number of files, default: 80): " W_VALUE
W_VALUE=${W_VALUE:-80}

# Prompt for optional arguments
read -p "Enter any additional tcpdump options (or leave blank): " OPTIONAL_ARGS

# Run tcpdump in the background
sudo tcpdump -s0 -w "$OUTPUT_FILE" -C "$C_VALUE" -W "$W_VALUE" $OPTIONAL_ARGS &

# Get the PID of the last background process (tcpdump)
PID=$!

# Output the PID
echo "tcpdump is running in the background with PID: $PID"
