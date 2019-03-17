FROM openjdk:8-jdk-alpine
VOLUME /tmp
ARG JAR_FILE
WORKDIR /
ADD ${JAR_FILE} target/app.jar
RUN sh -c 'touch target/app.jar'
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","target/app.jar"]