#!bin/bash

## Deploy Postgres Server
kubectl apply -f docker/postgres/postgres-deployment.yml

## Port Forward to Expose Postgres Database
# kubectl port-forward service/postgres 5432:5432

## Deploy Application Server [Postgres]
kubectl apply -f docker/app/app-deployment-postgres.yml

## Port Forward to Expose Running Java Application + Documentation
# kubectl port-forward service/user-rest-api-postgres 9001:9001