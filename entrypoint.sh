#!/bin/bash
set -e

if [ -n "$1" ]; then
  exec "$@"
else
  exec /usr/bin/java -Dfile.encoding=UTF-8 -Djava.awt.headless=true -Dapple.awt.UIElement=true -Dunifi.core.enabled=false -Xmx1024M -XX:+UseParallelGC -XX:+CrashOnOutOfMemoryError -XX:ErrorFile=/usr/lib/unifi/logs/hs_err_pid%p.log -Dunifi.datadir=/usr/lib/unifi/data -Dunifi.logdir=/usr/lib/unifi/logs -Dunifi.rundir=/usr/lib/unifi/run -jar /usr/lib/unifi/lib/ace.jar start
fi
