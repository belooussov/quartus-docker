#!/bin/bash
#brew install socat
#/opt/X11/bin/XQuartz
#xhost +
#pkill socat
socat TCP-LISTEN:6000,reuseaddr,fork UNIX-CLIENT:\"$DISPLAY\" &
docker run -ti --rm -e DISPLAY=docker.for.mac.host.internal:0 jess/firefox
