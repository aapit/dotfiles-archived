#!/bin/bash
# Change dir to one of the Sites dirs
# by David Spreekmeester @aapit

BASE_PATH=$HOME/Sites

if [ "$1" = "" ]; then
    echo 'Which site dir?'
else
    BEGINS_WITH="$1*"
    CONTAINS="*$1*"
    DIR_PATTERN="find $BASE_PATH -maxdepth 1 -type d -name \"%s\" -print -quit"
    DIR_BEGINS_WITH=$(printf "$DIR_PATTERN" "$BEGINS_WITH")
    FOUND_DIR=$(eval $DIR_BEGINS_WITH)

    if [ "$FOUND_DIR" = "" ]; then
        DIR_CONTAINS=$(printf "$DIR_PATTERN" "$CONTAINS")
        FOUND_DIR=$(eval $DIR_CONTAINS)
    fi

    if [ "$FOUND_DIR" = "" ]; then
        echo '404 not found, frowny face.'
    else
        cd $FOUND_DIR
    fi
fi

