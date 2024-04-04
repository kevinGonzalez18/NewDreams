FROM amazoncorretto:21-alpine-jdk
COPY target/mavenproject1-1.0-SNAPSHOT.war app.war
ENTRYPOINT ["java", "-jar", "/app.war"]