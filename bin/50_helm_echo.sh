#!/bin/bash
set -e

# Install external secrets operator using helm
helm upgrade --install echo-server ./charts/echo-server --namespace echo-server --create-namespace