# Use the specified pre-built container as the base image
FROM bpasunuri/webapp:latest

# Set the working directory to /var/www/html
WORKDIR /var/www/html

# Copy the content
COPY . .

# Expose port 80
EXPOSE 82

# Start the web server
CMD ["apache2-foreground"]

