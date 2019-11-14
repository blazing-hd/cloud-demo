# Get build image
FROM gradle:6.0.0-jdk8 as builder

# Copy source code to image
COPY . /app

# Set working directory
WORKDIR /app

# Run build
RUN gradle build

# New image for running application
FROM java:8-jdk-alpine

# expose port
EXPOSE 8080

# Copy build .war file to new image directory
COPY --from=builder /app/build/libs/*.war /usr/app/

# Change working directory
WORKDIR /usr/app

# Run application
ENTRYPOINT ["java", "-jar", "nasapicture-0.0.1-SNAPSHOT.war"]
