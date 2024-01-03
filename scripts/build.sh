# Experiment: build_local.sh
#!/bin/bash
echo Getting version info from lavalink-devs/Lavalink
URL="https://github.com/lavalink-devs/Lavalink/releases/download/4.0.0/Lavalink.jar"
TAG=$(echo $(curl $URL -s) | jq .[0].tag_name)

DOCKER_TAG="mewwme/lavalink:$(echo $TAG | tr -d '"')"

echo "Building docker image $DOCKER_TAG"
docker build -t $DOCKER_TAG .
