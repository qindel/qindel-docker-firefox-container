#!/bin/bash
UIDNUM=$(id -u)
GIDNUM=$(id -g)
FIREFOXHOME=$HOME/firefox

mkdir -p $FIREFOXHOME

/usr/bin/docker run --name=firefox --rm -v /tmp/.X11-unix:/tmp/.X11-unix -v $FIREFOXHOME:/home/firefox -e UIDNUM=$UIDNUM -e GIDNUM=$GIDNUM -e DISPLAY=$DISPLAY -t qindel/firefox

