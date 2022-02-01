#!bin/bash

## Port Forward to Expose MySql Database
kubectl port-forward service/mysql 3306:3306 

## Port Forward to Expose Postgres Database
kubectl port-forward service/postgres 5432:5432 

## Migrate Data from Mysql to Postgres
pgloader mysql://root:password@localhost:3306/test postgresql://spring-user:secret@localhost:5432/test
