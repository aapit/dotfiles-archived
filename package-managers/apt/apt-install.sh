#!/bin/bash
SCRIPT_PATH="`dirname \"${BASH_SOURCE[0]}\"`"
. ${SCRIPT_PATH}/apt-repos.sh
sudo apt install $(/bin/cat ${SCRIPT_PATH}/apt-packages.txt)
