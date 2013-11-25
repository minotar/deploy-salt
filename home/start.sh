#!/bin/sh
SERVICE='minotard'

if ps ax | grep -v grep | grep $SERVICE > /dev/null
then
    echo "$SERVICE service running, everything is fine"
else
    echo "$SERVICE is not running"
    cd /home/minotar/go/bin/
    screen -dmS minotard ./minotar
fi

