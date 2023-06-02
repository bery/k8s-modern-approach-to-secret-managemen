#!/bin/bash
set -e
kubectl config use-context docker-desktop
# Install external secrets operator using helm
helm repo update &&
helm upgrade --install external-secrets external-secrets/external-secrets --namespace external-secrets --create-namespace