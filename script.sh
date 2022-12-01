#!/bin/bash

echo "Building images:"

docker build -t williameiji/kubs-php-app:1.0 app/.
docker build -t williameiji/kubs-database:1.0 database/.

echo "Uploading images to docker hub: "

docker push williameiji/kubs-php-app:1.0
docker push williameiji/kubs-database:1.0

echo "Creating services: "

kubectl apply -f ./services.yml

echo "Creating deployments"

kubectl apply -f ./deployments.yml