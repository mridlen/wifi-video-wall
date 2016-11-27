#!/bin/bash

# this will pick up the offset when it gets handed out by the master node

# display number is for setting different offset numbers on a per-display basis
# this is helpful in case there are issues outside your control (e.g. one unit
# runs via wifi, another runs over wired ethernet). Preferably you will want to
# set this uniquely to all units so they can be offset independently.
display_number=1

port=1003

# script begins here
nc -lk -p $port | while read line
do
    array=($line)
    for i in "${array[@]}"
    do
        if [[ $(echo $i | awk -F ',' '{print $1}') = $display_number ]]; then
            offset=$(echo $i | awk -F ',' '{print $2}')
            echo "offset: $offset"
            if [[ $(cat offset_client.value) -ne $offset ]]; then
                echo "setting offset value in offset_client.value..."
                echo $offset > offset_client.value
            fi
        fi
    done
done
# script ends here
