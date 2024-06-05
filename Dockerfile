# Use the specified base image
FROM hshar/webapp

# Set the working directory to /var/www/html
WORKDIR /var/www/html

# Copy the application code to the container
COPY . /var/www/html

# Expose port 80 (or whichever port your application listens on)
EXPOSE 80

# Define the entry point script
ENTRYPOINT ["/path/to/entrypoint.sh"]

# Or if you are using a typical web server start command, you can use:
# CMD ["apache2-foreground"] # Example for Apache, adjust accordingly

