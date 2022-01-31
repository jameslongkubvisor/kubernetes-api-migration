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
2. Containerize the Java Rest API Application [ MySQL ] and Deploy to Kubernetes
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

