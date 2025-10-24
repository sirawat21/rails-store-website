#!/bin/zsh

ENV_PATH="."
ENV_FILE=".env"

if command -v docker >/dev/null 2>&1 && docker info >/dev/null 2>&1; then
    echo "Start project containers [$(ls $ENV_PATH | grep $ENV_FILE)]"
    if [ -d "$ENV_PATH" ] && [ -f "$ENV_PATH/$ENV_FILE" ]; then
        docker-compose --env-file "$ENV_PATH/$ENV_FILE" -f docker-compose.yml up -d
    else
        echo "Environment file not found."
        exit 1
    fi
else
  echo "Docker is either not installed or not running."
  exit 1
fi