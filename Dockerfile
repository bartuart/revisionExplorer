FROM openjdk:8-jdk-alpine
ARG JAR_FILE
WORKDIR /
ADD ${JAR_FILE} app.jar
RUN ls -l
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/app.jar"]