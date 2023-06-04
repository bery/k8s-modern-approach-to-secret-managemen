#!/bin/bash
set -e
# Install external secrets operator using helm
helm upgrade --install external-secrets external-secrets/external-secrets --namespace external-secrets --create-namespace

sleep 10

kubectl apply -f ./manifests/30_secret_store_v1.yaml