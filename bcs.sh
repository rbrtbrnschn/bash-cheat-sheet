#!/bin/bash
BIN="/usr/local/bin"
if [ $0 == "$BIN/bcs" ]; then export SRC="$BIN/bash-cheat-sheet";
else export SRC="$PWD"; fi
export COMMON="$SRC/common"
$SRC/update.sh

# Exit Codes
FOUND_MUTLIPLE=203
FOUND_ONE=201
FOUND_NONE=204
SNIPPET_ADDED=210

while getopts ":-:a:" OPTION; do
	case $OPTION in
		-)
			case $OPTARG in
				add)
					$SRC/add.sh $2
					shift 2
					exit $SNIPPET_ADDED
				;;
				debug)
					export DEBUG=1
					$SRC/loggers.sh
					shift
				;;
			esac
		;;
		a)
		$SRC/add.sh $2
		shift 2
		;;
	esac
done

FILE=( $(find $SRC -iname "*$1*" -type f) )
RES_LENGTH=${#FILE[@]}

if [ $RES_LENGTH -gt 1 ]; then
	cat ${FILE[0]} | xclip -sel clip || cat $FILE
	exit $FOUND_MULTIPLE
elif [ $RES_LENGTH -eq 1 ]; then
	cat $FILE | xclip -sel clip || cat $FILE
	exit $FOUND_ONE
else
	echo "please be more precise"
	exit $FOUND_NONE
fi


