#!/bin/bash
echo "SYSTEMD_CONF_PATH? (ex: /home/isucon/isuumo/confs/systemd)"
read SYSTEMD_CONF_PATH

echo "SYSTEMD_FILE? (ex: isuumo.python.service)"
read SYSTEMD_FILE

mkdir -p $SYSTEMD_CONF_PATH
echo "$SYSTEMD_CONF_PATH created"

if [ -L /etc/systemd/system/$SYSTEMD_FILE ]; then
    echo "rm symbolic file /etc/systemd/system/$SYSTEMD_FILE"
    rm /etc/systemd/system/$SYSTEMD_FILE
else
    /etc/systemd/system/$SYSTEMD_FILE /etc/systemd/system/$SYSTEMD_FILE.bak
fi

ln -s $SYSTEMD_CONF_PATH/$SYSTEMD_FILE /etc/systemd/system/$SYSTEMD_FILE

