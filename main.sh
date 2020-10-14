#!/bin/bash
toolsDir='/tools'
DOMAIN="$1"
data_dir="/data"
function notify {
    python3 /code/message.py "$1"
}

function httpx-exec {
    httpx -silent -no-color -l "$data_dir/final.txt" -title -content-length -web-server -status-code -ports 80,443 -threads 25 -o "$data_dir/httpx-$DOMAIN.txt"
}

function main {
    httpx-exec
}

{ time main ; } 2> time.txt
t=$(cat time.txt | grep real | cut -d " " -f2)
c=$(cat /data/httpx-$DOMAIN.txt | wc -l)
realistic=$(($c / 2))
notify "HTTPX found $c ($realistic) online for $DOMAIN in $t"
