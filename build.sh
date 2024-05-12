#! /bin/bash

if [[ "$ARCH" == "" ]] || [[ "$DIST" == "" ]]; then
    echo "Usage: env ARCH=... DIST=... bash $0 [--pull] [--push]"
    exit 2
fi

set -e
set -x

log() { echo "$(tput setaf 2)$(tput bold)$*$(tput sgr0)" ; }

dockerfile="Dockerfile.$DIST-$ARCH"

if [ "$IMAGE_NAME" == "" ];then
    image_name="quay.io/appimage/appimagebuild:$DIST-$ARCH"
else
    image_name="$IMAGE_NAME:$DIST-$ARCH"
fi

pull=
push=

while [ "$1" != "" ]; do
    case "$1" in
        "--pull")
            pull=1
            ;;
        "--push")
            push=1
            ;;
    esac

    shift
done

if [ "$pull" != "" ]; then
     docker pull "$image_name" || echo "Warning: pulling base image failed"
fi

docker build --pull --cache-from "$image_name" -t "$image_name" -f "$dockerfile" .

if [ "$push" != "" ]; then
    log "pushing to quay.io"
    echo

    docker push "$image_name"
fi
