#!/bin/bash

# Go to the home directory of ec2-user
cd /home/ec2-user

# Download the latest .jar file from S3
aws s3 cp s3://my-bucket-java23/spring-boot-complete-0.0.1-SNAPSHOT.jar .

# Check if the jar was downloaded successfully
if [ -f "spring-boot-complete-0.0.1-SNAPSHOT.jar" ]; then
  # Run the Spring Boot application in the background and log the output
  nohup java -jar spring-boot-complete-0.0.1-SNAPSHOT.jar > app.log 2>&1 &
else
  echo "JAR file download failed!" > error.log
fi
