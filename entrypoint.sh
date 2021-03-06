#!/bin/bash
set -e

if [ -n "$1" ]; then
  exec "$@"
else
  exec /bin/jsvc -cwd /usr/lib/unifi -home /usr/lib/jvm/java-8-openjdk-amd64 -cp /usr/share/java/commons-daemon.jar:/usr/lib/unifi/lib/ace.jar -pidfile /var/run/unifi/unifi.pid -procname unifi -umask 027 -user unifi -Dunifi.datadir=/var/lib/unifi -Dunifi.logdir=/var/log/unifi -Dunifi.rundir=/var/run/unifi -Dunifi.core.enabled=false -Xmx1024M -Djava.awt.headless=true -Dfile.encoding=UTF-8 -nodetach com.ubnt.ace.Launcher start
fi
