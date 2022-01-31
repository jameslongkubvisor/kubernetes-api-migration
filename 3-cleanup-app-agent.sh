#!bin/bash

## Remove Java Application [ MySQL version ]
kubectl delete -f docker/app/app-deployment-mysql.yml

## Remove Migration Agent
kubectl delete -f docker/agent/agent-deployment.yml