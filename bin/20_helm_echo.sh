#!/bin/bash

kubectl config set-context docker-desktop
# Install external secrets operator using helm
helm repo add ealenn https://ealenn.github.io/charts &&
helm repo update &&
helm upgrade --install echo-server ./charts/echo-server --namespace echo-server --create-namespace \
    --set application.enable.file=false \
    --set application.enable.header=false \
    --set application.enable.request=false \
    --set application.enable.http=false \
    --set application.enable.host=false