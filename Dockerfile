FROM adoptopenjdk/maven-openjdk8

RUN mkdir /tmp/app

ADD . /tmp/app

WORKDIR /tmp/app

RUN mvn package

WORKDIR /tmp/app/target

RUN ls -l 


#OLUME /tmp
#RUN javac -version
#RUN mvn -version
#ARG JAR_FILE
#COPY ${JAR_FILE} app.jar
#ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/app.jar"]