#!bin/bash

## Clone Java Rest API Applicaiton
git clone https://github.com/wagnerjfr/sprinboot-rest-mysql.git

## Enter Directory
cd sprinboot-rest-mysql

## Install Dependencies [ Skip Tests as it causes Build to fail]
bash ./mvnw install -DskipTests

## Build
# bash ./mvnw clean package -DskipTests

## Initial Start [ MySql -> Load User]
# bash ./mvnw clean spring-boot:run

## Build the Java Rest API Application + Docker Image [ not used ]
bash ./mvnw clean package docker:build -DskipTests

## Exit Directory [ Back to File Root ]
cd ..

## Build All Docker Container and Tag them
docker-compose build 