#!/bin/bash

kubectl config set-context docker-desktop
# Install external secrets operator using helm
helm repo update &&
helm upgrade --install external-secrets external-secrets/external-secrets --namespace external-secrets --create-namespace

helm upgrade --install sealed-secrets sealed-secrets/sealed-secrets -n sealed-secrets --create-namespace

helm upgrade --install ingress-nginx ingress-nginx \
  --repo https://kubernetes.github.io/ingress-nginx \
  --namespace ingress-nginx --create-namespace