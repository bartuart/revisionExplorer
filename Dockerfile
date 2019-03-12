FROM adoptopenjdk/maven-openjdk8

RUN mkdir /tmp/app

ADD . /tmp/app

WORKDIR /tmp/app

RUN mvn package && mv target/revisionExplorer-0.0.1-SNAPSHOT.jar /app.jar

ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/app.jar"]