#!/usr/bin/env bash

chromium-browser \
    --user-data-dir=/profile \
    --no-first-run \
    --password-store=basic \
    --use-mock-keychain \
    https://photos.google.com
