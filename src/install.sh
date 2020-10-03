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

URL="$API/$MODULE"
curl -O -J "$URL"
STATUSCODE=$( curl -s -o /dev/null -I -w "%{http_code}" $URL)
[[ $STATUSCODE != 200 ]] && exit 0
[ ! -d $BCS_MODULES ] && mkdir $BCS_MODULES

mv $MODULE.tar $TMP_DIR/$MODULE.tar
tar -C $BCS_MODULES -xf $TMP_DIR/$MODULE.tar
echo "$MODULE installed"
