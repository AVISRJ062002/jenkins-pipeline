#!/bin/bash

IMAGE=$1

docker stop app || true
docker rm app || true

docker run -d --name app $IMAGE