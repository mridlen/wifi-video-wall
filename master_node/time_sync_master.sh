#!/bin/bash
ip_address=10.0.0.181
port=1000
foo=bar

#initial date reset
echo "1 $(date +%s.%3N)" | nc $ip_address $port

while [[ $foo -eq "bar" ]]; do
    echo "0 $(date +%s.%3N)" | nc $ip_address $port
    sleep 1
done
