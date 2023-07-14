#!/bin/bash
set -e
# kubectl config use-context docker-desktop
# Install external secrets operator using helm

helm del echo-server --namespace echo-server
helm del external-secrets --namespace external-secrets