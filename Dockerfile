FROM openjdk:11
COPY . . 
EXPOSE 8080
ADD app.jar app.jar
ENTRYPOINT ["java", "-jar", "app.jar"]
