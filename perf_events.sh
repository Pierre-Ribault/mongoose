#! /bin/bash
perf stat -x, -r 10 -e branch-instructions,branch-misses,bus-cycles,cache-misses                    $@ > /dev/null
perf stat -x, -r 10 -e cache-references,L1-dcache-load-misses,L1-dcache-loads,L1-dcache-stores      $@ > /dev/null
perf stat -x, -r 10 -e L1-icache-load-misses,LLC-load-misses,LLC-loads                              $@ > /dev/null
perf stat -x, -r 10 -e LLC-store-misses,LLC-stores,branch-load-misses,branch-loads,dTLB-load-misses $@ > /dev/null
perf stat -x, -r 10 -e dTLB-loads,dTLB-store-misses,dTLB-stores,iTLB-load-misses                    $@ > /dev/null
perf stat -x, -r 10 -e iTLB-loads                                                                   $@ > /dev/null
#perf stat -x, -e iTLB-loads,node-load-misses,node-loads                                       $@ > /dev/null
#perf stat -x, -e node-store-misses,node-stores                                                $@ > /dev/null
