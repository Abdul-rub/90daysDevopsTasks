#!/bin/bash

# Configuration
IMAGE_NAME="arub0419/sample-node-app"
TAG="latest"

# Error handling: Check Docker installed
if ! command -v docker &> /dev/null; then
  echo "❌ Docker is not installed. Please install Docker first."
  exit 1
fi

# Error handling: Check Docker daemon
if ! docker info > /dev/null 2>&1; then
  echo "❌ Docker daemon is not running or you don’t have permission."
  exit 1
fi

# Error handling: Check Docker login
if ! docker info | grep -q "Username:"; then
  echo "❌ You are not logged into Docker Hub. Run: docker login"
  exit 1
fi

# Build Docker image
echo "🛠️ Building Docker image: $IMAGE_NAME:$TAG"
docker build -t $IMAGE_NAME:$TAG ./sample-node-app

if [ $? -ne 0 ]; then
  echo "❌ Docker build failed!"
  exit 1
fi

# Push to Docker Hub
echo "📤 Pushing Docker image to Docker Hub..."
docker push $IMAGE_NAME:$TAG

if [ $? -ne 0 ]; then
  echo "❌ Docker push failed!"
  exit 1
fi

echo "✅ Docker image built and pushed successfully!"

