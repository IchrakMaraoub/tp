FROM java:8
EXPOSE 8090
VOLUME /tmp
WORKDIR /code
RUN apt-get update  
RUN apt-get install -y maven
RUN ["mvn", "dependency:resolve"]  
RUN ["mvn", "verify"]
ADD src /code/src  
RUN ["mvn", "package"]
ADD target/spring-boot-rest-0.3.0.jar app.jar
RUN bash -c 'touch /app.jar'
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-Dspring.profiles.active=container","-jar","/app.jar"]
