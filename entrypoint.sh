#!/bin/bash
#
set -x
groupadd -g $GIDNUM $GROUP
useradd -m -d $USERHOME -u $UIDNUM -g $GIDNUM $USER
usermod -p '$6$lk8cmMD5$TdqkoIwYiUpvZtmWCf.E0qABGYH/nOIgq0gPsAFEQF/zHXPy3PsnMwy4QnF8kypQBEJjjyyoHZAPiufqYwLvo.' $USER
chown -R $UIDNUM:$GIDNUM $USERHOME
su - $USER -c "DISPLAY=$DISPLAY /usr/bin/firefox"
