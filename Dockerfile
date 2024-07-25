# Use the official Gradle image to build the application with Java 21
FROM gradle:jdk21 AS build

# Set the working directory inside the container
WORKDIR /app

# Copy the project files to the container
COPY . .

RUN ./gradlew clean build

# Build the application
RUN gradle build --no-daemon

# Use a lightweight JDK image to run the application with Java 21
FROM openjdk:21-jdk-slim

# Set the working directory inside the container
WORKDIR /app

# Copy the built application from the build stage
COPY --from=build /app/build/libs/*.jar app.jar

# Expose the application port
EXPOSE 8080

# Command to run the Spring Boot application
ENTRYPOINT ["java", "-jar", "app.jar"]
