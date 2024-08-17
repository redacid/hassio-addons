#!/bin/bash

WORKDIR="../"
cd $WORKDIR

/home/redacid/scripts/dockerlogin.sh

version="0.0.1"
jsonsrc="tools/mpd-arch.json"

docker buildx create --name buildx_ra-mpd --use

keys=$(jq -r 'keys | .[]' ${jsonsrc})
for id in ${keys}
do
  name=$(jq -r ".[${id}].name" ${jsonsrc})	
  image=$(jq -r ".[${id}].image" ${jsonsrc})
  buildArch=$(jq -r ".[${id}].buildArch" ${jsonsrc})

  echo "ARCH: ${name} BuildArch: ${buildArch} BUILD_FROM: ${image}"

  docker buildx build --platform=linux/${buildArch} --build-arg BUILD_FROM=${image} -t redacid/ha-mpd-${name}:${version} --push .
  docker buildx build --platform=linux/${buildArch} --build-arg BUILD_FROM=${image} -t ghcr.io/redacid/ha-mpd-${name}:${version} --push .
done

docker buildx prune -f
docker buildx stop
