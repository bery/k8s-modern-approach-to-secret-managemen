#!/bin/bash
set -e
# kubectl config use-context docker-desktop
# Install external secrets operator using helm

helm upgrade --install ingress-nginx ingress-nginx \
  --repo https://kubernetes.github.io/ingress-nginx \
  --namespace ingress-nginx --create-namespace

helm upgrade --install stakater-reloader stakater/reloader \
  --namespace stakater-reloader --create-namespace