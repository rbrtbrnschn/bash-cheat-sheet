#!/bin/bash

function key {
	local URL
	URL="$API/key?key=123"
	KEY=$(curl -s $URL)

	GREP=$(cat $PACKAGELEE | grep API_KEY)
	[ "$GREP" == "" ] && echo "API_KEY=$KEY" >> $PACKAGELEE && echo "Added API KEY"
	[ ! "GREP" == "" ] && cat $PACKAGELEE | sed -e "/API_KEY/d" > .temp && cat .temp > $PACKAGELEE && rm .temp && echo "API_KEY=$KEY" >> $PACKAGELEE && echo "Refreshed API KEY"
}

key $*

