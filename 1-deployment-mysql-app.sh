#!bin/bash

## Deploy MySql Server
kubectl apply -f ./docker/mysql/mysql-deployment.yml

## Deploy Application Server [MySql]
kubectl apply -f ./docker/app/app-deployment-mysql.yml

## Follow the logs of the Java Application [ mysql ]
# kubectl logs -f deployment/user-rest-api-mysql

## Port Forward to Expose Running Java Application [ mysql ]
# kubectl port-forward service/user-rest-api-mysql 9000:9000
# kubectl port-forward service/user-rest-api-postgres 9001:9001