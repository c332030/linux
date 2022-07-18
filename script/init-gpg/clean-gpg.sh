#!/bin/sh

echo 'clean-gpg'

set -e

if [ ! "$GPG_PRIVATE_KEY" ]; then
  echo GPG_PRIVATE_KEY not exists
  exit 1
fi

user=$(whoami)

echo "user: $user"
echo "home:" ~

if [ "root" = "$user" ]
then
  USER_HOME=/root
else
  USER_HOME=/home/$user
fi

GPG_PATH=$USER_HOME/.gnupg
echo "GPG_PATH: $GPG_PATH"

echo "clean GRADLE_USER_HOME: $GPG_PATH"
ls -lh "$GPG_PATH"
rm -rf "$GPG_PATH"

if [ ! ~ = "$USER_HOME" ]
then
  echo "clean ~/.gnupg"
  ls -lh ~/.gnupg
  rm -rf ~/.gnupg
fi

echo 'clean-gpg successfully'
