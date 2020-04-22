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
mkdir /home/$GUEST/.ssh
echo "$GUEST:$PASSWD" | chpasswd 2>&1 | sed 's|^|## |g'
ssh-keygen -t rsa -b 1024 -f /home/$GUEST/.ssh/id_rsa -N "" -q
echo "####################################################################"
echo "## Guest users key:" >&2
cat /home/$GUEST/.ssh/id_rsa
echo "####################################################################"
find /home/$GUEST/.ssh -exec chmod og= {} \;
chown -R $GUEST: /home/$GUEST
exec dumb-init "$@"
