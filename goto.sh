#!/bin/sh

# navigate to arg directory or user directory
if [ -z "$1" ]; then
    cd /home/me/workspace/github.com/mydrilla || exit
else
    cd /home/me/workspace/github.com/mydrilla/"$1" || exit
fi
