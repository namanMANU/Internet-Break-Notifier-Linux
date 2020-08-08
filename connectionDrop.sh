#!/bin/bash

downTime=0
flg=0
lastAccessTime=$(date +"%s")
while [ true ]; do

if ! ping -c1 google.com >& /dev/null; then
    downTime=$(( $(date +"%s") - $lastAccessTime ))
else
    if [ $flg -gt 0 ]; then

    flg=0
    zenity --info --title "Internet Connection" --text "You Can Work Now" --timeout=5 --width=500
    
    fi    
    downTime=0
    lastAccessTime=$(date +"%s")
fi

sleep 5

if [ $downTime -ge 10 ]; then

    if [ $flg -lt 1 ]; then
        
        flg=1
        zenity --warning --title "Connection Is Down" --text "Sorry Your Life Is Hell" --timeout=5 --width=500
    fi
fi

done