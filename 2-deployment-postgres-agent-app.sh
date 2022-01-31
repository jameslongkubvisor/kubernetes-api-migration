#!bin/bash

## Deploy Postgres Server
kubectl apply -f docker/postgres/postgres-deployment.yml

## Port Forward to Expose Postgres Database
# kubectl port-forward service/postgres 5432:5432

## Deploy Migration Agent 
kubectl apply -f docker/agent/agent-deployment.yml

## Follow the logs of the Java Application [ postgres ]
kubectl logs -f deployment/migration-agent

## Deploy Application Server [Postgres]
# kubectl apply -f docker/app/app-deployment-postgres.yml

## Follow the logs of the Java Application [ postgres ]
# kubectl logs -f deployment/user-rest-api-postgres
