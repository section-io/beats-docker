#!/bin/bash

USER=sysadmin
IP=192.168.1.38
ACCT=$USER@$IP

push() {
    for f in ./* ; do 
        if [[ -d $f ]]; then
            scp -r $f $ACCT:/home/$USER/
        elif [[ -f $f ]]; then
            scp $f $ACCT:/home/$USER/$f
        else
            echo "invalid $f"
        fi
    done
}

if [ "$1" == "" ]; then
    push
else
    $1
fi