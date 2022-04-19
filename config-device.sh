#!/usr/bin/bash

echo ""
echo "Configuring device variables ..."

echo "Determine where to setup devie specific variables."
read -p ">>> Do you work with .devicerc for bash and zsh or just .bashrc? ...type 'devicerc' or 'bashrc' and press <Enter>: "
if [[ $REPLY = devicerc ]]; then
    shellrc=$HOME/.devicerc
elif [[ $REPLY = bashrc ]]; then
    shellrc=$HOME/.bashrc
else
    echo "Restart script and choose devicerc or bashrc. Exiting ..."
    exit 1
fi


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
