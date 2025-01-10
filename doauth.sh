#!/usr/bin/env bash
set -e
set -o pipefail

mkdir -p ${PROFILE_DIR:-./profile}
chmod a+w ${PROFILE_DIR:-./profile}

docker build . --tag gphotos-sync
(cd auth
docker build .
docker compose up -d

sleep 2

echo "Press any key after you have authenticated http://$(hostname):6080/vnc_lite.html in your browser"
read -p "Open chromium by using the open-chrome.sh script then close that chromium browser window before closing the VNC browser tab"

docker compose down)
