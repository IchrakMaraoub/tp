FROM openjdk:8
EXPOSE 8080


RUN apt-get update  
RUN apt-get install -y maven

ADD pom.xml pom.xml  
RUN ["mvn", "dependency:resolve"]  
RUN ["mvn", "verify"]

# Adding source, compile and package into a fat jar
ADD src src  
RUN ["mvn", "package"]

ADD app.jar app.jar
RUN bash -c 'touch /app.jar'
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-Dspring.profiles.active=container","-jar","/app.jar"]
