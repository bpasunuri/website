# Use the pre-built container as the base image
FROM bpasunuri/webapp

# Copy the application code to the web server directory
COPY . /var/www/html

# Copy the entrypoint script from Jenkins workspace to the desired location
COPY entrypoint.sh /var/www/html

# Set execute permissions for the entrypoint script
RUN chmod +x /var/www/html/entrypoint.sh

# Expose port 80 to the outside world
EXPOSE 80

# Define the default command to run when starting the container
CMD ["apache2ctl", "-D", "FOREGROUND"]

