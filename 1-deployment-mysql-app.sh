#!bin/bash

## Deploy MySql Server
kubectl apply -f ./docker/mysql/mysql-deployment.yml

## Deploy Application Server [MySql]
kubectl apply -f ./docker/app/app-deployment-mysql.yml

## Port Forward to Expose MySql Database
# kubectl port-forward service/mysql 3306:3306