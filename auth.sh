#!/usr/bin/env bash
set -e
set -o pipefail

mkdir -p profile

docker run -p 6080:80 \
    -v ./profile:/config \
    -v ./auth_desktop:/root/Desktop \
    dorowu/ubuntu-desktop-lxde-vnc

sleep 2
open http://localhost:6080/

read -p "Press any key after you have authenticated in the browser window..."

docker compose down
