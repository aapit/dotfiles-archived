#!/bin/bash
SCRIPT_PATH="`dirname \"${BASH_SOURCE[0]}\"`"
. ${SCRIPT_PATH}/apt-repos.sh
sudo apt install -y $(/bin/cat ${SCRIPT_PATH}/apt-packages.txt)
sudo apt autoremove
