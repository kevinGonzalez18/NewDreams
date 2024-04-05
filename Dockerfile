FROM amazoncorretto:11-alpine-jdk
MAINTAINER New_Dreams
COPY target/mavenproject1-1.0-SNAPSHOT.war New_Dreams-app.war
ENTRYPOINT ["java", "-jar", "New_Dreams-app.war"]
