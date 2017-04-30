#! /bin/bash

../perf_events.sh timeout 1 ./zip.sh 2> results/zip.txt;
rm deleteme.zip
