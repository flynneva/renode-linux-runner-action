#!/usr/bin/bash

if ! command -v act &> /dev/null; then
    echo "You need nektos/act to run this action: https://github.com/nektos/act"
    exit
fi

echo -e "{\n  \"act\": true\n}" > env.json

act -j build-and-test -e env.json --container-options "--privileged"
rm env.json