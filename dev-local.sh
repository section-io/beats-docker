#!/bin/bash

USER=sysadmin
IP=192.168.1.38
ACCT=$USER@$IP

push_dockerfile() {
    scp Dockerfile.build $ACCT:/home/$USER/Dockerfile.build
}

push_edited_files() {
    scp beats.txt $ACCT:/home/$USER/beats.txt
    scp version.json $ACCT:/home/$USER/version.json
    scp Makefile $ACCT:/home/$USER/Makefile.txt
}

push_dirs() {
    scp -r bin $ACCT:/home/$USER
    scp -r build $ACCT:/home/$USER
    scp -r templates $ACCT:/home/$USER
    scp -r tests $ACCT:/home/$USER
}

push_installs() {
    scp installs.sh $ACCT:/home/$USER/install.sh
}

push() {
    push_dirs
    push_dockerfile
    push_edited_files
}

if [ "$1" == "" ]; then
    push
else
    $1
fi