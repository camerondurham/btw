#!/bin/bash

DEST="$HOME/wall"
mkdir -p $DEST
cd $DEST || exit 1

losangelesnight="https://images.unsplash.com/photo-1444723121867-7a241cacace9?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1950&q=80"
losangelessunset="https://images.unsplash.com/photo-1572925151789-c13420b54514?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1189&q=80"
newyork="https://images.unsplash.com/photo-1499092346589-b9b6be3e94b2?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1051&q=80"

declare -A backgrounds=( [losangelesnight.jpg]="$losangelesnight"  [losangelessunset.jpg]="$losangelessunset" [newyork.jpg]="$newyork")

for key in "${!backgrounds[@]}"; do
    echo "downloading $key"
    wget -O "$key" "${backgrounds[$key]}"
done
