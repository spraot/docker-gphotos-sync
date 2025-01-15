#!/usr/bin/env bash

PROFILE_DIR=${PROFILE_DIR:-./profile}

docker build . --tag gphotos-sync || exit 1

docker run -it \
    -v ./${PROFILE_DIR}:/tmp/gphotos-cdp \
    -v ./photos:/download \
    gphotos-sync:latest \
    /app/sync.sh

rm ${PROFILE_DIR}/Singleton*