#!/bin/bash
# Author: David Spreekmeester @aapit
# Connects to an existing multiplexer session or creates one.
# Falls back from tmux to screen to non-multiplex bash.

SESSION_NAME=$(whoami)
function ssh () { 
    /usr/bin/ssh -t $@ "tmux attach -t $SESSION_NAME 2>/dev/null || tmux new -s $SESSION_NAME 2>/dev/null || screen -d -r $SESSION_NAME 2>/dev/null || screen -S $SESSION_NAME 2>/dev/null || bash";
}
