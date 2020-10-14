#!/bin/bash
toolsDir='/tools'
DOMAIN="$1"
baseDir="/root/$DOMAIN"

function notify {
    python3 /code/message.py "$1"
}

httpx -silent -no-color -l "$baseDir/domains-$DOMAIN.txt" -title -content-length -web-server -status-code -ports 80,443 -threads 25 -o "$baseDir/httpx-$DOMAIN.txt"


notify "$1"

