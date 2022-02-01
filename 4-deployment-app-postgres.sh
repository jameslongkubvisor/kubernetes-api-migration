#!bin/bash

## Deploy Java Application Server [Postgres]
kubectl apply -f docker/app/app-deployment-postgres.yml

## Follow the logs of the Java Application [ postgres ]
kubectl logs -f deployment/user-rest-api-postgres

