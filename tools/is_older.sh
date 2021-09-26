#!/bin/bash

# TODO: figure out why tf this doesn't always work at certain times of the day

function usage() {
    echo "Usage:"
    echo "   is_modified FILEPATH [OLDTIME_IN_SECONDS]"
    echo "   example:"
    echo "       is_modified ~/.zshrc 3600 # was modified in last hour"
    echo "       is_modified ~/.zshrc  # (default) was modified in last 5 hours (18000s)"
}

# slightly modified from https://stackoverflow.com/a/28341234/4676641
function is_older() {

    if [[ "$#" != "0" ]]; then
        FILE=$1
        OLDTIME=${2:-18000} # edited in last 5 hours is default
        # get current and file times
        CURTIME=$(date +%s)
        FILETIME=$(stat -t %s -f %m $FILE)
        TIMEDIFF=$(expr $CURTIME - $FILETIME)

        # check if file older
        if [ $TIMEDIFF -gt $OLDTIME ]; then
            return 1
        else
            return 0
        fi
    else
        usage
        return 1
    fi
}
