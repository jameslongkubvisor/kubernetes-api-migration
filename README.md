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