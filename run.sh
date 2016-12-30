#!/bin/bash

docker rm -vf openhab
docker run \
        --name openhab \
        -v /etc/localtime:/etc/localtime:ro \
        -v /etc/timezone:/etc/timezone:ro \
        -v /srv/openhab/conf:/openhab/conf \
        -v /srv/openhab/userdata:/openhab/userdata \
        -d \
        -p 8080:8080 \
        --restart=always \
        --device=/dev/ttyUSB0 \
        openhab/openhab:amd64-offline
