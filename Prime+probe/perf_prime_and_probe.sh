#! /bin/bash

perf stat -x, -e instructions,cycles,task-clock,page-faults,cpu-clock timeout 10 firefox --private linkedCacheTester.html #2> pp_attack.txt
perf stat -x, -e branch-instructions,branch-misses,bus-cycles,cache-misses timeout 10 firefox --private linkedCacheTester.html #2> pp_attack.txt                  
perf stat -x, -e cache-references,L1-dcache-load-misses,L1-dcache-loads,L1-dcache-stores  timeout 10 firefox --private linkedCacheTester.html #2> pp_attack.txt   
perf stat -x, -e L1-icache-load-misses,LLC-load-misses,LLC-loads timeout 10 firefox --private linkedCacheTester.html #2> pp_attack.txt                            
perf stat -x, -e LLC-store-misses,LLC-stores,branch-load-misses,branch-loads,dTLB-load-misses timeout 10 firefox --private linkedCacheTester.html #2> pp_attack.txt
perf stat -x, -e dTLB-store-misses,dTLB-stores,iTLB-load-misses  timeout 10 firefox --private linkedCacheTester.html #2> pp_attack.txt                            
perf stat -x, -e dTLB-loads,iTLB-loads timeout 10 firefox --private linkedCacheTester.html #2> pp_attack.txt                                                      
