FROM maven:3.9-eclipse-temurin-23 AS build

WORKDIR /build

COPY pom.xml ./
RUN mvn -B -ntp dependency:go-offline

COPY src ./src
RUN mvn -B -ntp clean package -DskipTests

FROM tomcat:11.0-jdk25-temurin-jammy

COPY --from=build /build/target/*.war /usr/local/tomcat/webapps/_03_final_project_war.war

EXPOSE 8080

CMD ["catalina.sh", "run"]
