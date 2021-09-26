#!/bin/bash

function export_existing_to_path() {
    if [[ $# < 2 ]]; then
        echo "please provide a path and envvar name"
        return 1
    fi

    local var_name=$1
    local var_value=$2

    if [[ -e "$var_value" ]]; then
        export "$var_name"="$var_value"
    else
        echo "environment variable pair { $var_name : $var_value } is invalid"
    fi
}
