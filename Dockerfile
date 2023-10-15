# Use an official Java runtime as the base image
FROM openjdk:11-jre-slim

# Set the working directory
WORKDIR /app

# Copy the entire project directory into the container
COPY . .

# Specify the command to run your Java application
CMD ["java", "-jar", "my-java-app.jar"]

