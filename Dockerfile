FROM openjdk:11
EXPOSE 8080
RUN apt-get update  
RUN apt-get install -y maven

ADD pom.xml /code/pom.xml  
RUN ["mvn", "dependency:resolve"]  
RUN ["mvn", "verify"]

# Adding source, compile and package into a fat jar
ADD src /code/src  
RUN ["mvn", "package"]
ADD target/app.jar app.jar
ENTRYPOINT ["java", "-jar", "app.jar"]
