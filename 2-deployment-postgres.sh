#!bin/bash

## Deploy Postgres Server
kubectl apply -f docker/postgres/postgres-deployment.yml

## Deploy Application Server [Postgres]
# kubectl apply -f docker/app/app-deployment-postgres.yml

