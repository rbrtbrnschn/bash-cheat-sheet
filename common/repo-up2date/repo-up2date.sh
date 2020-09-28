#!/bin/bash

# git standard is 'origin'
REMOTE="master" 

# exit codes
REPO_UP_TO_DATE=200
REPO_NEEDS_UPDATE=201
REPO_UPDATED=202

# Change Remote name with [-r --remote]
while getopts "f:-:" OPTION; do
	case $OPTION in
		r)
			REMOTE="$OPTARG"
		;;
		-)
			case $OPTARG in
				remote)
					REMOTE="$2"
				;;
			esac
		;;
	esac
done

# Check if valid git repo
if [ -d .git ]; then
	:
else
	echo "NOT valid git repo" >&2
	exit 1
fi

GIT_REMOTE_VERBOSE=$(git remote -v | grep -sw "fetch")

LENGTH_REMOTE=${#REMOTE}
START=$(( $LENGTH_REMOTE +1 ))
REMOVE_FROM_END=8 # length of (fetch), the grep search expr
END=$(( ${#GIT_REMOTE_VERBOSE} - $START - $REMOVE_FROM_END))

REMOTE_URI=${GIT_REMOTE_VERBOSE:$START:$END}
LOCAL_COMMIT_ID=$(git log --format="%H" -n 1)
REMOTE_COMMIT_ID=$(git ls-remote $REMOTE_URI HEAD)

REMOTE_COMMIT_ID=( $REMOTE_COMMIT_ID )
REMOTE_COMMIT_ID="${REMOTE_COMMIT_ID[0]}"

# Checks if updated
if [ "$LOCAL_COMMIT_ID" == "$REMOTE_COMMIT_ID" ]; then
	exit $REPO_UP_TO_DATE
else
	echo "Remote is ahead of local."
	read -p "Want to pull from $REMOTE? [y/n] " BOO
	case $BOO in
		[yY] | [yY][eE][sS])
			BRANCH=$(git symbolic-ref HEAD)
			BRANCH=${BRANCH:11:100}
			git pull $REMOTE $BRANCH
			exit $REPO_UPDATED
		;;
		[nN] | [nN][oO])
			echo "LOCAL REPO NOT UP TO DATE!" >&2
			exit $REPO_NEEDS_UPDATE
		;;
		*)
		echo "Wrong Answer - Not updating." >&2
		exit 1
	esac
fi
