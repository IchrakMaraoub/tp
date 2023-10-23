FROM openjdk:11
WORKDIR /code
EXPOSE 8080
RUN apt-get update  
RUN apt-get install -y maven
ADD pom.xml /code/pom.xml  
RUN ["mvn", "dependency:resolve"]  
RUN ["mvn", "verify"]
# Adding source, compile and package into a fat jar
ADD src /code/src  
RUN ["mvn", "package"]
ADD target/spring-boot-rest-0.3.0.jar app.jar
RUN bash -c 'touch /app.jar'
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-Dspring.profiles.active=container","-jar","/app.jar"]
