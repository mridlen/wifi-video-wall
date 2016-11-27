#!/bin/bash

    nc -lk -p 1000 | while read line
    do
        line_timestamp=$(echo $line | awk -F ' ' '{print $2}' )
        line_reset=$(echo $line | awk -F ' ' '{print $1}' )

        if [[ $line_reset = 1 ]]; then
            date +%s.%N -s @2010000000.000000000
        fi

        if [[ $(date +%s.%N) > $line_timestamp ]]; then
                date +%s.%N -s @$line_timestamp
                printf "date set to newer time: $line_timestamp\n"
        fi
    done
