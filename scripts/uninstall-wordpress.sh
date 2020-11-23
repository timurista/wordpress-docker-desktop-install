#!/bin/bash
kubectl config use-context docker-desktop

# helm chart for wordpress
helm uninstall my-wordpress
