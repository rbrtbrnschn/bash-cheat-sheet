#!/bin/bash

REMOTE_MODULES=$($SRC/clean_list.sh)
LOCAL_MODULES=""
[ ! -d $BCS_MODULES ] && mkdir $BCS_MODULES
for ITEM in $(ls $BCS_MODULES);do
	LOCAL_MODULES+="$ITEM "
done

LIST="$REMOTE_MODULES $LOCAL_MODULES"
LIST=($LIST)
UNIQUE=$(printf "%s\n" "${LIST[@]}" | sort -u)

for ITEM in ${UNIQUE[@]};do
	if [[ "$REMOTE_MODULES" =~ "$ITEM" && "$LOCAL_MODULES" =~ "$ITEM" ]];then
		echo "$(tput setaf 2)[INSTALLED]:	$ITEM$(tput sgr0)" >&2
	elif [[ "$LOCAL_MODULES" =~ "$ITEM" ]];then
		echo "$(tput setaf 3)[LOCAL]:	$ITEM$(tput sgr0)" >&2
	else
		echo "$(tput setaf 1)[AVAILABLE]:	$ITEM$(tput sgr0)" >&2
	fi
done
