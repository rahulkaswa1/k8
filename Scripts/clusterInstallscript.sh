#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Define Minikube profile and number of nodes
PROFILE_NAME="blackbox"
NODES=3
CPUS=2
MEMORY=4096
DRIVER="docker"
CONTAINER_RUNTIME="containerd"
ADDONS="metrics-server,dashboard,default-storageclass,storage-provisioner,registry,registry-aliases,gvisor"

echo "🔧 Checking for existing Minikube installation..."
if ! command -v minikube &> /dev/null; then
  echo "📥 Installing Minikube..."
  curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
  sudo install minikube-linux-amd64 /usr/local/bin/minikube
  rm minikube-linux-amd64
  echo "✅ Minikube installed."
else
  echo "✅ Minikube is already installed."
fi

echo "🚀 Starting Minikube cluster with profile: $PROFILE_NAME"
minikube start \
  --nodes=$NODES \
  --profile=$PROFILE_NAME \
  --cpus=$CPUS \
  --memory=$MEMORY \
  --driver=$DRIVER \
  --container-runtime=$CONTAINER_RUNTIME \
  --logtostderr=true \
  --wait=all \
  --addons=$ADDONS

echo "🔍 Verifying Minikube status..."
minikube status --profile=$PROFILE_NAME
 