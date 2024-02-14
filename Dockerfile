FROM mysql:8.0.30
COPY ./db/conf.d /etc/mysql/conf.d
COPY ./db/initdb.d /docker-entrypoint-initdb.d

RUN chmod 644 /etc/mysql/conf.d/my.cnf

FROM openjdk:17 AS builder
COPY gradlew .
COPY gradle gradle
COPY build.gradle .
COPY settings.gradle .
COPY src src
RUN chmod +x ./gradlew
RUN ./gradlew bootJar

FROM adoptopenjdk/openjdk17
COPY --from=builder build/libs/*.jar app.jar
ENTRYPOINT ["java", "-jar", "/app.jar"]
VOLUME /tmp
