#!/bin/bash
# Change dir to one of the Sites dirs

BASE_PATH=$HOME/Sites

if [ "$1" = "" ]; then
    echo 'Which site dir?'
else
    THE_DIR=$(find $BASE_PATH -maxdepth 1 -type d -name "*$1*" -print -quit)
    if [ "$THE_DIR" = "" ]; then
        echo '404 not found, frowny face.'
    else
        cd $THE_DIR
    fi
fi

