#!/bin/bash

# Prerequisites:
# 1. The Flush+Reload spy tool exists at ../../flush-reload/spy.

source ../funcs.sh
trap 'exp_failed' ERR

# Leaves the ouput directory in $OUTPUT_DIR.
source ../experiment.sh

cp ../flush-reload/spy $EXTRA_INPUT/spy

status "Starting the spy process."
../flush-reload/spy hello.probe > $OUTPUT_DIR/spy.output &
SPY_PID=$!

# Wait for the spy to get started.
sleep 2

status "Running ./hello"
# Run the vulnerable target program.
(
    echo "H";
    echo "H";
    echo "E";
    echo "E";

    echo "L";
    echo "L";

    echo "L";
    echo "L";

    echo "O";
    echo "O";

    echo "Q";
) | ./hello > $OUTPUT_DIR/hello.output

# Stop the spy process.
status "Killing the spy process"
kill -9 "$SPY_PID"

exp_completed
