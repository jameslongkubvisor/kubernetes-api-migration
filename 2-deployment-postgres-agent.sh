#!bin/bash

## Deploy Postgres Server
kubectl apply -f docker/postgres/postgres-deployment.yml

## Deploy Migration Agent 
kubectl apply -f docker/agent/agent-deployment.yml

## Run Migration Agent Command
kubectl exec migration-agent -- pgloader mysql://root:password@mysql/test postgresql://spring-user:root@localhost/
