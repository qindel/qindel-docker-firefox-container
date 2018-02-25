#!/bin/bash
#
set -x
groupadd -g $GIDNUM $GROUP
useradd -m -d $USERHOME -u $UIDNUM -g $GIDNUM $USER
usermod -p '$6$lk8cmMD5$TdqkoIwYiUpvZtmWCf.E0qABGYH/nOIgq0gPsAFEQF/zHXPy3PsnMwy4QnF8kypQBEJjjyyoHZAPiufqYwLvo.' $USER
mkdir -p $PULSESOCKETDIR
chown -R $UIDNUM:$GIDNUM $USERHOME $PULSESOCKET
#su - $USER -c "DISPLAY=$DISPLAY PULSE_SERVER=$PULSE_SERVER /usr/bin/firefox"
su - $USER -c "DISPLAY=$DISPLAY /usr/bin/firefox $ARGUMENTS"
