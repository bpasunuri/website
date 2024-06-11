# Use an existing Docker image as a base
FROM bpasunuri/webapp:latest

# Set the working directory inside the container
WORKDIR /var/www/html

# Copy the contents of your code repository into the container
COPY . .

# Install Apache HTTP Server
RUN apt-get update && apt-get install -y apache2

# Expose port 80 for HTTP traffic
EXPOSE 80

# (Optional) Define any default commands to run when the container starts
# CMD ["apache2ctl", "-D", "FOREGROUND"]


