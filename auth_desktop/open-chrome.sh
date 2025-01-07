#!/usr/bin/env bash

google-chrome \
    --user-data-dir=/config\
    --disable-gpu \
    --no-sandbox \
    --no-first-run \
    --password-store=basic \
    --use-mock-keychain \
    --disable-software-rasterizer \
    https://google.com
