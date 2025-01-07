#!/usr/bin/env bash

docker build . --tag gphotos-sync || exit 1

docker run -it \
    -v ./profile:/tmp/gphotos-cdp \
    -v ./photos:/download \
    gphotos-sync:latest \
    /app/sync.sh

rm ./profile/Singleton*