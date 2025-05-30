#!/bin/bash

# Build the Docker image
docker build -t electron-secure-defaults:latest .

# Run the build in the container
docker run --rm \
  -v "$(pwd)/package:/app/package" \
  electron-secure-defaults:latest 