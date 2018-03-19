#!/bin/sh
set -e

nohup /usr/bin/Xvfb :0 -screen 0 1280x720x24 &

exec "$@"