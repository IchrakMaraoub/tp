FROM openjdk:8
EXPOSE 8080


RUN apt-get update  
RUN apt-get install -y maven
RUN ["mvn", "package"]

RUN bash -c 'touch /app.jar'
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-Dspring.profiles.active=container","-jar","/app.jar"]
