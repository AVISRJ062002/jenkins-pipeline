#!/bin/bash
apt update -y
apt install -y docker.io
systemctl start docker

docker run -d -p 9090:9090 prom/prometheus
docker run -d -p 3000:3000 grafana/grafana