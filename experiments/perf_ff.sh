#! /bin/bash

# try and not have multiple things with firefox in them
PID=$(pgrep firefox)

../perf_events.sh -t $PID sleep 1 2> $1
