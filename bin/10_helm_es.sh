#!/bin/bash

kubectl config set-context docker-desktop
# Install external secrets operator using helm
helm repo update &&
helm install external-secrets external-secrets/external-secrets --namespace external-secrets --create-namespace

