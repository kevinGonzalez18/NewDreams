FROM amazoncorretto:11-alpine-jdk
MAINTAINER New_Dreams
COPY targe/mavenproject1-1.0-SNAPSHOT.war New_Dreams-app.jar
ENTRYPOINT ["java","-jar","New_Dreams-web.war"]
