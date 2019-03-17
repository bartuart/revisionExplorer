FROM openjdk:8-jdk-alpine
#VOLUME /tmp
#ARG JAR_FILE
WORKDIR /
ADD target/revisionExplorer-0.0.1-SNAPSHOT.jar app.jar
#RUN ls -l && java -version
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","app.jar"]