# Stage 1: Build the application using Maven
FROM maven:3.9-eclipse-temurin-17 AS build
WORKDIR /app
COPY pom.xml .
# Pre-download dependencies to speed up future builds
RUN mvn dependency:go-offline -B
COPY src ./src
# RUN mvn clean package

# Stage 2: Deploy to Tomcat
FROM tomcat:10-jdk17
# Copy the compiled .war file from the build stage to Tomcat's webapps directory
COPY --from=build /app/target/*.war /usr/local/tomcat/webapps/ROOT.war
EXPOSE 8080
CMD ["catalina.sh", "run"]
