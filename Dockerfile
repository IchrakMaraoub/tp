FROM openjdk:11
COPY . . 
EXPOSE 8080
RUN apt-get update  
RUN apt-get install -y maven
ADD target/app.jar app.jar
ENTRYPOINT ["java", "-jar", "app.jar"]
