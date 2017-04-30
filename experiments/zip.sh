#! /bin/bash 

head -c 100MB </dev/urandom | gzip > deleteme.zip
