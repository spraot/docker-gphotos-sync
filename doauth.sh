#!/usr/bin/env bash
set -e
set -o pipefail

PROFILE_DIR=${PROFILE_DIR:-./profile}

mkdir -p $PROFILE_DIR

docker build . --tag gphotos-sync

cd auth
PUID=$(id -u) PGID=$(id -g) docker compose up -d --build

echo "giving VNC time to be ready, please wait..."
sleep 8

echo "Open chromium by using the open-chrome.sh script then close that chromium browser window before closing the VNC browser tab"
read -p  "Press any key after you have authenticated http://$(hostname):6080/vnc_lite.html in your browser"

docker compose down
