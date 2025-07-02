# Use a Maven image to build the app
FROM maven:3.9.6-eclipse-temurin-17 AS builder
WORKDIR /app
COPY . .
RUN mvn clean package -DskipTests

# Use a slim JDK to run the app
FROM eclipse-temurin:17-jdk-alpine
WORKDIR /app
COPY --from=builder /app/target/dummyapp-1.0-SNAPSHOT.jar app.jar
CMD ["java", "-jar", "app.jar"]
