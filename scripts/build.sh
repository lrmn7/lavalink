# Experiment: build_local.sh
#!/bin/bash
echo Getting version info from lavalink-devs/Lavalink
URL="https://api.github.com/repos/lavalink-devs/Lavalink/releases"
TAG=$(echo $(curl $URL -s) | jq .[0].tag_name)

DOCKER_TAG="mewwme/lavalink:$(echo $TAG | tr -d '"')"

echo "Building docker image $DOCKER_TAG"
docker build -t $DOCKER_TAG .