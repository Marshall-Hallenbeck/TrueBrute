#!/bin/sh

if test $# -eq 2; then
    num=0
    while read line; do
	truecrypt -t --password=$line --non-interactive $1 2>/dev/null
	if [ $? -eq 0 ]; then
	    echo "Cracked! Password found on line $num: $line"
	    break;
	fi
	num=$((num+1))
    done < $2
    truecrypt -d $1
else
    echo "use: bruteTruecrypt.sh [truecrypt-volume] [word-list]"
fi
