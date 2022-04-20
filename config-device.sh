#!/usr/bin/bash

echo ""

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

if echo $PREFIX | grep -o "com.termux"; then
    setup_type=termux
    keys_dir=$HOME/gpg-tools/gpg-keys
else
    setup_type=linux
    keys_dir=$SOFTWARE_CUSTOM/gpg-tools/gpg-keys
    CWD=$(pwd)
    [[ -d $keys_dir ]] || keys_dir=$CWD/gpg-keys
fi


echo ""
echo "Configuring device variables ..."

[[ -f $shellrc ]] || touch $shellrc
source $shellrc

if [[ $DEVICE = '' ]]; then
    echo "... for the first time."
    read -p "Enter a name for this device: " DEVICE
    DEVICE=$DEVICE
else
    echo "... again for this device named '$DEVICE'."
fi

if [[ $setup_type == linux ]]; then
    if [[ $EMAIL = '' ]]; then
        read -p "Enter a main email address: " EMAIL
        EMAIL=$EMAIL
    fi
fi

setting="export DEVICE=$DEVICE"; grep -qxF "$setting" $shellrc || echo $setting >> $shellrc;
setting="export EMAIL=$EMAIL"; grep -qxF "$setting" $shellrc || echo $setting >> $shellrc;

echo "done"
echo ""
