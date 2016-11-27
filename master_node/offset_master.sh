#!/bin/bash
ip_address=10.0.0.181
port=1003
foo=bar

while [[ $foo -eq "bar" ]]; do
    echo "1,10 2,15 3,10 4,25" | nc $ip_address $port
    sleep 5
done
