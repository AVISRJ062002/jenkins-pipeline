#!/bin/bash

if ! git rev-parse HEAD~1 >/dev/null 2>&1; then
  echo "ALL"
  exit 0
fi

CHANGED=$(git diff --name-only HEAD~1 HEAD | cut -d/ -f1 | sort | uniq)

if [ -z "$CHANGED" ]; then
  echo "No changes detected. Building all services."
  echo "ALL"
else
  echo "$CHANGED"
fi
