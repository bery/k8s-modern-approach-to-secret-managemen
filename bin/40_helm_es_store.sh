#!/bin/bash
set -e
# Install external secrets operator using helm
kubectl apply -f ./bin/manifests/30_secret_store_v1.yaml

