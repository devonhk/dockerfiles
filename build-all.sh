#!/bin/bash
set -e

for subproject in $(find . -name 'Dockerfile' | sed 's|./||')
do
    image_name=$(echo $subproject | awk '{split($0,a,"/"); print a[1]}')
    (cd $image_name && docker build -t pydo/"$image_name" .)
    echo "Building $subproject complete." 

    docker push pydo/"$image_name"
    echo "Publishing $subproject complete to hub.docker.com complete." 
done