FROM openjdk:8-jdk-alpine
#VOLUME /tmp
ARG JAR_FILE
WORKDIR /
ADD ${JAR_FILE} app.jar
#RUN ls -l && java -version
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","app.jar"]