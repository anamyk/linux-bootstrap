#!/usr/bin/bash

# Setup ssh
echo ""
echo "Coniguring ssh ..."
echo "Device $DEVICE ..."

if ls $HOME/.ssh/$DEVICE* 1> /dev/null 2>&1; then
    echo "SSH-Config: ssh keys for $DEVICE already exist"
else
    echo "SSH-Config: ssh key does not exist yet. Creating .."
    ssh-keygen -t ed25519 -C $DEVICE -f $HOME/.ssh/"$DEVICE"_id_ed25519
fi

sshconfig=$HOME/.ssh/config
[[ -f $sshconfig ]] || touch $sshconfig

setting="IdentityFile $HOME/.ssh/"$DEVICE"_id_ed25519"; grep -qxF "$setting" $sshconfig || echo $setting >> $sshconfig;

echo "done"
echo ""
