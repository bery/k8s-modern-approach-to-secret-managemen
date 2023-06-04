#!/bin/bash
set -e

kubectl apply -f ./manifests/30_secret_store_v1.yaml
# Install external secrets operator using helm
helm upgrade --install echo-server ./charts/echo-server --namespace echo-server --create-namespace \
    -f ./manifests/60_values_update.yaml