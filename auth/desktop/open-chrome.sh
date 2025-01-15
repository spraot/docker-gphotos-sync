#!/usr/bin/env bash

chromium-browser \
    --user-data-dir=/profile \
    --disable-gpu \
    --no-sandbox \
    --no-first-run \
    --password-store=basic \
    --use-mock-keychain \
    --disable-software-rasterizer \
    https://google.com