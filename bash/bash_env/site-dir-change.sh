#!/bin/bash

# Change dir to one of the Sites dirs

if [ "$1" = "" ]; then
    echo 'Which site dir?'
else
    cd $HOME/Sites/*$1*
fi

