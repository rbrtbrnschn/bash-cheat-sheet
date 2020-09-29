#!/bin/bash
MODULE=$1

# Creating Custom Directory
RAND_DIR="$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 16 | head -n 1)"
TMP_DIR="/tmp/$RAND_DIR"
mkdir $TMP_DIR

# Handle Cleanup
function handle_exit {
	rm -rf $TMP_DIR
}

trap handle_exit 0 1 SIGHUP SIGINT SIGKILL SIGTERM SIGSTOP

curl "https://doesisaacbeat.me/get/$MODULE" --output $TMP_DIR/$MODULE.tar
tar -c $PWD/packages/$MODULE -xvf $TMP_DIR/$MODULE.tar
# TODO Test & Enabled Cross Origin Requests
