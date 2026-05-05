#!/bin/bash

set -euo pipefail

apt update -y
apt install -y docker.io openjdk-17-jdk git curl unzip

systemctl start docker
usermod -aG docker ubuntu

# Install Jenkins
wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | apt-key add -
echo "deb https://pkg.jenkins.io/debian-stable binary/" > /etc/apt/sources.list.d/jenkins.list

apt update
apt install -y jenkins

systemctl start jenkins
systemctl enable jenkins

echo "Waiting for Jenkins to start..."
sleep 60

GITHUB_TOKEN="${GITHUB_TOKEN:-}"
REPO_OWNER="${REPO_OWNER:-AVISRJ062002}"
REPO_NAME="${REPO_NAME:-jenkins-pipeline}"
PUBLIC_IP="$(curl -s ifconfig.me)"
JENKINS_URL="http://${PUBLIC_IP}:8080/github-webhook/"

if [ -n "$GITHUB_TOKEN" ]; then
  curl -X POST "https://api.github.com/repos/${REPO_OWNER}/${REPO_NAME}/hooks" \
  -H "Authorization: token $GITHUB_TOKEN" \
  -H "Accept: application/vnd.github.v3+json" \
  -d "{
    \"name\": \"web\",
    \"config\": {
      \"url\": \"$JENKINS_URL\",
      \"content_type\": \"json\"
    },
    \"events\": [\"push\"],
    \"active\": true
  }"
fi
