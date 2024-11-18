#!/bin/bash

# A script to ping a range of IPs in a given network prefix
# Usage: ./ping_scan.sh <IP_PREFIX>
# Example: ./ping_scan.sh 172.16.5
# This will scan IPs from 172.16.5.1 to 172.16.5.254
# Active hosts will be saved to active_hosts.txt

if [ -z "$1" ]; then
  echo "Usage: $0 <IP_PREFIX>"
  echo "Example: $0 172.16.5"
  exit 1
fi

PREFIX=$1

# Clear previous results from active_hosts.txt
> active_hosts.txt

for i in {1..254}; do
  (ping -c 1 -W 1 ${PREFIX}.$i | grep "bytes from" && echo "${PREFIX}.$i" >> active_hosts.txt) &
done

wait
echo "Scan complete. Active hosts saved to active_hosts.txt"
