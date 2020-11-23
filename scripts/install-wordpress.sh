#!/bin/bash
# verfiy 

# make sure to use your local docker destop
kubectl config use-context docker-desktop

HTTP_PORT=8007

# helm chart for wordpress
helm repo add bitnami https://charts.bitnami.com/bitnami
helm install my-wordpress \
    --set service.port=$HTTP_PORT \
    --set service.httpsPort=8443 \
    --set mariadb.image.debug=true \
    bitnami/wordpress

# kubectl --watch 
./creds.sh
