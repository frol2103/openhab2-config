#!/bin/bash

DIR=$(cd $(dirname $0) && pwd)

docker rm -vf openhab
docker run \
        --name openhab \
        --net=host \
        -v /etc/localtime:/etc/localtime:ro \
        -v /etc/timezone:/etc/timezone:ro \
        -v $DIR/conf:/openhab/conf \
        -v $DIR/userdata:/openhab/userdata \
        -v $DIR/addons:/openhab/addons\
        -d \
        -p 8080:8080 \
        --restart=always \
        openhab/openhab:2.1.0-amd64
 
#       --device=/dev/ttyUSB0 \
