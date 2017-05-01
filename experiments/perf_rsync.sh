#! /bin/bash

../perf_events.sh timeout 1 rsync data/random1GB .randomCopy 2> results/rsync.txt
rm .randomCopy
