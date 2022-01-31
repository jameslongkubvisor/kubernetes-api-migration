#!bin/bash

## Clone Java Rest API Applicaiton
git clone https://github.com/wagnerjfr/sprinboot-rest-mysql.git

## Enter Directory
cd sprinboot-rest-mysql

## Install Dependencies [ Skip Tests as it causes Build to fail]
bash ./mvnw -DskipTests

## Build
bash ./mvnw clean package -DskipTests

## Initial Start [ MySql -> Load User]
# bash ./mvnw clean spring-boot:run

## Build the Java Rest API Application + Docker Image [ not used ]
bash ./mvnw clean package docker:build -DskipTests

## Copy Output Jar to Do
cp ./target/docker/spring-rest-mysql-0.0.1-SNAPSHOT.jar ../docker/

## Exit Directory [ Back to File Root ]
cd ..

## Build All Docker Container and Tag them
docker-compose build 