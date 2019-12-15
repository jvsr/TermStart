#!/bin/bash

export TERMSTART_DIR="$HOME/TermStart"

echo "setupCompleted=0" > $TERMSTART_DIR/config/setup.conf
$TERMSTART_DIR/TermStart.bash
