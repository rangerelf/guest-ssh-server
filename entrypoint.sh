#!/bin/bash

## Create ssh host keys
ssh-keygen -A

## Create guest user.
echo "## Creating Guest User"
GUEST="guest${RANDOM:0:3}"
PASSWD="$(dd if=/dev/urandom bs=1 count=10 2>/dev/null | base64 | sed 's/=*$//g')"
echo "## Login: $GUEST"
echo "## Password: $PASSWD (you can't use this though)"
adduser -D $GUEST
echo "$GUEST:$PASSWD" | chpasswd 2>&1 | sed 's|^|## |g'
mkdir /home/$GUEST/.ssh
cd /home/$GUEST/.ssh
ssh-keygen -t rsa -b 1024 -f ./id_rsa -N "" -q
ln -v id_rsa.pub authorized_keys
echo "####################################################################"
echo "## Guest users private ssh key:                                   ##"
echo "####################################################################"
cat id_rsa
echo "####################################################################"
find . -exec chmod og= {} \;
cd /
chown -R $GUEST: /home/$GUEST
exec dumb-init "$@"
