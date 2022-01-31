#!bin/bash

## Deploy Postgres Server
kubectl apply -f docker/postgres/postgres-deployment.yml

## Port Forward to Expose Postgres Database
# kubectl port-forward service/postgres 5432:5432

## Deploy Migration Agent 
kubectl apply -f docker/agent/agent-deployment.yml

## Run Migration Agent Command
kubectl exec migration-agent -- pgloader mysql://root:password@mysql/test postgresql://spring-user:root@localhost/

## Deploy Application Server [Postgres]
kubectl apply -f docker/app/app-deployment-postgres.yml


