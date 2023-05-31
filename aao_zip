#/usr/bin/env bash

if [[ $# -ne 1 ]]; then
    echo "Usage: $(basename $0) <zip file name>"
    exit 1
fi

zip -r "$1.zip" "$1" -x "$1/node_modules/*"
exit 0
