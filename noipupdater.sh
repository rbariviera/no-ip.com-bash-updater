#!/bin/bash

cd $(dirname $0);

# No-IP uses emails as usernames, so make sure that you encode the @ as %40
USERNAME=username
PASSWORD=password
HOST=hostsite
LOGDIR=logdir             # best to use full absolute path (because of crontab integration)
CONFIGDIR=configdir       # best to use full absolute path (because of crontab integration)
LOGFILE=$LOGDIR/noip.log
USERAGENT="Simple Bash No-IP Updater/0.4 antoniocs@gmail.com"

# create directories if not exist
mkdir -p $LOGDIR
mkdir -p $CONFIGDIR

RESULT=$(curl -isS -u "${USERNAME}:${PASSWORD}" -H "user-agent: ${USERAGENT}" "http://dynupdate.no-ip.com/nic/update?hostname=${HOST}")
LOGLINE="[$(date +"%Y-%m-%d %H:%M:%S")] $RESULT"

echo $LOGLINE >> $LOGFILE

exit 0
