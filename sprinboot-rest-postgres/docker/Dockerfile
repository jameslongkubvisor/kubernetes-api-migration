FROM openjdk:8-jdk-alpine

LABEL maintainer="Wagner Franchin"

RUN apk update && apk add ca-certificates wget && update-ca-certificates

ADD spring-rest-postgres*.jar /spring-rest-postgres.jar

CMD ["java", "-jar", "/spring-rest-postgres.jar"]
