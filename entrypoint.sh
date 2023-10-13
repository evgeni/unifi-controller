#!/bin/bash
set -e

if [ -n "$1" ]; then
  exec "$@"
else
  exec /usr/bin/java -Dfile.encoding=UTF-8 -Djava.awt.headless=true -Dapple.awt.UIElement=true -Dunifi.core.enabled=false -Xmx1024M -XX:+UseParallelGC -XX:+ExitOnOutOfMemoryError -XX:+CrashOnOutOfMemoryError -XX:ErrorFile=/usr/lib/unifi/logs/hs_err_pid%p.log -Dunifi.datadir=/var/lib/unifi -Dunifi.logdir=/var/log/unifi -Dunifi.rundir=/var/run/unifi --add-opens java.base/java.lang=ALL-UNNAMED --add-opens java.base/java.time=ALL-UNNAMED --add-opens java.base/sun.security.util=ALL-UNNAMED --add-opens java.base/java.io=ALL-UNNAMED --add-opens java.rmi/sun.rmi.transport=ALL-UNNAMED -jar /usr/lib/unifi/lib/ace.jar start
fi
