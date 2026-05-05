#!/bin/bash

apt update -y
apt install -y docker.io curl

systemctl start docker

docker run -d -p 9000:9000 sonarqube:lts

sleep 90

# Create token automatically
TOKEN=$(curl -u admin:admin -X POST "http://localhost:9000/api/user_tokens/generate?name=jenkins")

echo $TOKEN > /home/ubuntu/sonar_token.txt