FROM adoptopenjdk/maven-openjdk8
#OLUME /tmp
RUN javac -version
RUN mvn -version
#ARG JAR_FILE
#COPY ${JAR_FILE} app.jar
#ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/app.jar"]