#! /bin/bash

#../perf_events.sh timeout 10 ../Epoch3-gpgv2/spy -e ../Epoch3-gpgv2 -t 200 -s 10000 -p M:0x49465f -p S:0x494b10 -p R:0x493b60
../perf_events.sh timeout 1 ../Epoch3-gpgv2/spy -e ../Epoch3-gpgv2/gpg -t 200 -s 10000 -p M:0x49465f -p S:0x494b10 -p R:0x493b60 2> results/attack.txt
