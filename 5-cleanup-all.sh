#!bin/bash

## Remove Java Application [ MySQL version ]
kubectl delete -f docker/app/app-deployment-mysql.yml

## Remove MySQL Application
kubectl delete -f docker/mysql/mysql-deployment.yml

## Remove Migration Agent
kubectl delete -f docker/agent/agent-deployment.yml

## Remove Java Application [ Postgres version]
kubectl delete -f docker/app/app-deployment-postgres.yml

## Remove Postgres Application
kubectl delete -f docker/postgres/postgres-deployment.yml