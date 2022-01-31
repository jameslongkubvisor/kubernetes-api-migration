#!bin/bash

## Deploy MySql Server
kubectl apply -f ./docker/mysql/mysql-deployment.yml

## Deploy Application Server [MySql]
kubectl apply -f ./docker/application/app-deployment-mysql.yml

