# Create A mysql Container [Version 8 Defined in Applicaiton files]
FROM mysql:8.0

## Copy conf to enable Password Based Authentication
COPY /data/my.cnf /etc/mysql/conf.d/my.cnf

CMD ["mysqld"]

EXPOSE 3306
