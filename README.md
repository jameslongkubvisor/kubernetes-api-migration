# kubernetes-api-migration
Migration of a Simple Rest API Application to Kubernetes and Database from MySQL to Postgres

## Migration Strategy
Pull the rest API Application from the Repository, build the application
``` 
git clone https://github.com/wagnerjfr/sprinboot-rest-mysql.git
```

### Overview of Migration
Deployment Phase
1. Deploy MySQL Database to Kubernetes [ local ]
2. Deploy the Java Rest API Application [ MySQL ] to Kubernetes
3. Test the application
4. Deploy a Postgresql Container to the same Kubernetes Cluster [ local ]
5. Start Migration Host [ To Assist with DB Migration ]

Migration Phase
6. Migrate the Data From MySQL to Postgres using pgLoad
7. Deploy new instance of the Java Rest API Application with new DB credentials
8. Test Application

Wrap-up / Changeover Phase

### Technical Considerations 
Two Methods of migrating the Data in the MySQL database to Postgres were considered. 
1. Backup MySQL Database to a shared Volume and import into Postgres
2. Using an popular tool for Postgres Database Migrations [ pgloader ] running on an independent host in the cluster
It was decided using pgloader provided a much easier mechanism for migrating the data. Due to the system not being required to be production ready, persistent volumes were not bound to retain data. 
This required the the MySQL server is configured to allow for password authentication from its users. 

## Migration Process

### Requirements
docker-compose 
pgloader
kubectl


### Build
Build and tag the docker containers by executing the script 0-build.sh
```
bash 0-build.sh
```


### Deploy
Deploy the MySQL Container, and the Java Application [configured to connect to mysql] to the kubernetes cluster
```
## Deploy MySql Server
kubectl apply -f ./docker/mysql/mysql-deployment.yml

## Deploy Application Server [MySql]
kubectl apply -f ./docker/app/app-deployment-mysql.yml
```

Deploy Postgres Database to the cluster
```
## Deploy Postgres Server
kubectl apply -f docker/postgres/postgres-deployment.yml
```

### Migrate Data
Forward the Ports to the MySQL and Postgres containers.
```
## Port Forward to Expose MySql Database
kubectl port-forward service/mysql 3306:3306 

## Port Forward to Expose Postgres Database
kubectl port-forward service/postgres 5432:5432 

```

Initiate the Data Migration using the tool pgloader
```
## Migrate Data from Mysql to Postgres
pgloader mysql://root:password@localhost:3306/test postgresql://spring-user:secret@localhost:5432/test
```

### Redeploy Java Application 
Redeploy the Java Rest API application with the new credentials.
```
## Deploy Java Application Server [Postgres]
kubectl apply -f docker/app/app-deployment-postgres.yml
```

### Test the Java Application 
Open the port to the Java Application
```
## Port Forward to Expose Running Java Application + Documentation
# kubectl port-forward service/user-rest-api-postgres 9001:9001 
```

Test using Curl
```
curl -X GET "http://localhost:9000/api/users"
curl -X GET "http://localhost:9000/api/users"
```

### Cleanup
Remove the MySQL Containers
```

```

