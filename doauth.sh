#!/usr/bin/env bash
set -e
set -o pipefail

mkdir -p profile

docker build . --tag gphotos-sync
cd auth
docker build .
docker compose up -d

sleep 2

read -p "Press any key after you have authenticated http://localhost:6080/ in your browser"

docker compose down
