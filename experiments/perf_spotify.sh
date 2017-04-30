#! /bin/bash

# try and not have multiple things with spotify in them
PID=$(pgrep spotify | head -n 1)

../perf_events.sh -t $PID sleep 1 2> results/spotify.txt
