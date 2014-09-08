#!/bin/bash

if [ ! -f /data/installed ]; then
  /data/install.sh
  /usr/bin/supervisord -n -c /etc/supervisor/supervisord.conf
else
  /usr/bin/supervisord -n -c /etc/supervisor/supervisord.conf
fi
