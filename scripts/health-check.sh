#!/bin/bash

URL=$1
ATTEMPTS=${2:-20}

for attempt in $(seq 1 "$ATTEMPTS"); do
  STATUS=$(curl -s -o /dev/null -w "%{http_code}" "$URL")

  if [ "$STATUS" -eq 200 ]; then
    echo "Service healthy: $URL"
    exit 0
  fi

  echo "Waiting for service: $URL (attempt $attempt/$ATTEMPTS, status $STATUS)"
  sleep 5
done

echo "Health check failed: $URL"
exit 1
