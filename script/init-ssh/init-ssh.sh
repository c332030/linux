#!/bin/sh

echo 'init-ssh'

set -e

user=$(whoami)

echo "user: $user"
echo "home:" ~

if [ ! "$SSH_PRIVATE_KEY" ]; then
  echo SSH_PRIVATE_KEY not exists
  exit 1
fi

if [ "root" = "$user" ]
then
  SSH_PATH=/root/.ssh
else
  SSH_PATH=~/.ssh
fi

echo "SSH_PATH: $SSH_PATH"

mkdir -p $SSH_PATH
chmod -R 700 $SSH_PATH

echo "
Host *
    ConnectTimeout 10
" >> $SSH_PATH/config
chmod 600 $SSH_PATH/config

echo "$SSH_PRIVATE_KEY" > $SSH_PATH/id_rsa
chmod 600 $SSH_PATH/id_rsa

echo 'init-ssh successfully'
