#!/bin/bash

echo -e "#########\n# build #\n#########"
docker build -t aarch64 .

echo -e "#######\n# run #\n#######"
docker run --rm --privileged -v $(pwd):/data aarch64

ls -lah .