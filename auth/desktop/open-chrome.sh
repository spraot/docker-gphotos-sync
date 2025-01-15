#!/usr/bin/env bash

rm -f /profile/Singleton*
chromium-browser \
    --user-data-dir=/profile \
    --no-first-run \
    --password-store=basic \
    --use-mock-keychain \
    --disable-dev-shm-usage \
    https://photos.google.com
