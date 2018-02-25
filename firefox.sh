#!/bin/bash
UIDNUM=$(id -u)
GIDNUM=$(id -g)
FIREFOXHOME=$HOME/firefox
ARGUMENTS=$@

mkdir -p $FIREFOXHOME

/usr/bin/docker run --name=firefox --rm --shm-size 2g \
                -v /tmp/.X11-unix:/tmp/.X11-unix \
                -v $FIREFOXHOME:/home/firefox \
                -e UIDNUM=$UIDNUM \
                -e GIDNUM=$GIDNUM \
                -e DISPLAY=$DISPLAY \
                -e ARGUMENTS=$ARGUMENTS \
                -t qindel/firefox:latest

