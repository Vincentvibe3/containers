#!/bin/bash

# Script to update all the images defined in distrobox.ini

if [[ -z $1 ]]; then
	INI_FILE="distrobox.ini"
else
	INI_FILE=$1
fi

echo "Using $INI_FILE"

FOUND_CONTAINER_IMAGES=$(cat $INI_FILE | grep image)

for image in $FOUND_CONTAINER_IMAGES; do 
	IMAGE_URL=$(echo $image | cut -d "=" -f2)
	echo "Pulling image $IMAGE_URL"
	podman pull $IMAGE_URL
done