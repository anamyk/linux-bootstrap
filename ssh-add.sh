#!/usr/bin/bash

cat $HOME/.ssh/"$DEVICE"_id_ed25519.pub
echo ""
echo ">>> add your <device-ssh-key.pub> to your github"
read -p ">>> waiting ... when done type 'done' and press <Enter>: "
if [[ $REPLY = done ]]
then
    echo ">>> continuing ..."
    echo ""
else
    echo ">>> ERROR: a valid gitub ssh config is needed for this script."
    echo ">>> Exiting ..."
    exit 1
fi

read -p ">>> Close Firefox. Is Firefox closed? ... if so, type 'closed' and press <Enter>: "
if [[ $REPLY = closed ]]; then
    echo ""
else
    echo ">>> ERROR: You need to close the programm first to avoid problems."
    echo ">>> Exiting ..."
    echo ""
    exit 1
fi

