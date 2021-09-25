#!/bin/bash

files_to_watch=

if [[ "$#" != "0" ]]; then
    filepattern=$1

    # -t sorts by last modified
    files_to_watch=$(ls -t "$filepattern"*)
else
    files_to_watch=$(ls -t)
fi

echo "files to watch: $files_to_watch"

