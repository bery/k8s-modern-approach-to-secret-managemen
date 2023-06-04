#!/bin/bash
set -e
# Install external secrets operator using helm
helm upgrade --install external-secrets external-secrets/external-secrets --namespace external-secrets --create-namespace
