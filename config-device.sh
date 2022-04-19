#!/usr/bin/bash

echo ""
echo "Configuring device variables ..."
# Setup the shell universals
shellrc=$HOME/.devicerc
# shellrc=$HOME/.bashrc
[[ -f $shellrc ]] || touch $shellrc
source $shellrc

if [[ $DEVICE = '' ]]; then
    echo "... for the first time."
    read -p "Enter a name for this device: " DEVICE
    DEVICE=$DEVICE
else
    echo "... again for this device named '$DEVICE'."
fi
if [[ $EMAIL = '' ]]; then
    read -p "Enter a main email address: " EMAIL
    EMAIL=$EMAIL
fi

setting="export DEVICE=$DEVICE"; grep -qxF "$setting" $shellrc || echo $setting >> $shellrc;
setting="export EMAIL=$EMAIL"; grep -qxF "$setting" $shellrc || echo $setting >> $shellrc;

echo "done"
echo ""
