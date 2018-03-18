#!/bin/bash

# Copyright (c) 2018 Jan "JayVii" <jayvii@posteo.de>
# SPDX-License-Identifier: GPL-3.0

SOURCEURL="git@localhost:jayvii.de/www.git"
#SERVERUSER="www-data:www-data"
RESTARTCMD="systemctl restart apache2"
WEBROOT="/var/www/html"

if [ -z "$SOURCEURL" ]; then
  echo "[ERROR] Source URL not set."
  exit 1;
fi
#if [ -z "$SERVERUSER" ]; then
#  echo "[ERROR] user not set."
#  echo "Set it in the form of:"
#  echo "www-data:www-data"
#  exit 1;
#fi
if [ -z "$RESTARTCMD" ]; then
  echo "[ERROR] restart command not set."
  exit 1;
fi
if [ -z "$WEBROOT" ]; then
  echo "[ERROR] webroot directory not set."
  exit 1;
fi

echo "[INFO] Entering webroot"
cd "$WEBROOT"
echo "[INFO] Pulling updates from $SOURCEURL"
git pull $SOURCEURL
#echo "[INFO] Making readadble/writable by $SERVERUSER"
#chown $SERVERUSER -R ./
echo "[INFO] Restarting Server"
$RESTARTCMD
echo "[INFO] Done."
