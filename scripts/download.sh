#!/bin/bash
APPLICATIONYML="https://raw.githubusercontent.com/lrmn7/lavanodes/main/application.yml.example"
URL="https://api.github.com/repos/lavalink-devs/Lavalink/releases"

JSON=$(curl $URL -s)
LAST=$(echo $JSON | jq -c .[0])
TAG=$(echo $LAST | jq -c .tag_name)

DOWNLOADTO=$(echo $LAST | jq -c "(.assets[] | select(.name ==\"Lavalink.jar\") | .browser_download_url)")

echo "----------- Lavalink version: $TAG -----------"
wget -O Lavalink.jar $(echo $DOWNLOADTO | tr -d '"')
wget -O application.yml $APPLICATIONYML
