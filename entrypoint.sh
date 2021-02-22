#!/bin/bash
set -e

if [ -n "$1" ]; then
  exec "$@"
else
  exec /usr/bin/java -Xmx1024M -jar /usr/lib/unifi/lib/ace.jar start
fi
