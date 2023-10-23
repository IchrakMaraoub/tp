FROM openjdk:11-jre-slim
EXPOSE 8080
COPY target/app.jar app/app.jar
ENTRYPOINT ["java", "-jar", "app/app.jar"]
