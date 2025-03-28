# Use an official Maven image to build the project
FROM maven:3.9-eclipse-temurin-17 AS build
WORKDIR /app

# Copy necessary files
COPY pom.xml ./
COPY server ./server
COPY webapp ./webapp

# Build the project
RUN mvn clean package -DskipTests

# Use a lightweight JDK runtime for the final image
FROM eclipse-temurin:17-jdk
WORKDIR /app

# Copy the built JAR file from the previous stage
COPY --from=build /app/server/target/*.jar app.jar

# Expose the application port
EXPOSE 8080

# Run the application
CMD ["java", "-jar", "app.jar"]
