# Use the pre-built container as the base image
FROM bpasunuri/webapp

# Copy the application code to the web server directory
COPY . /var/www/html

# Expose port 80 to the outside world
EXPOSE 80

# Define the default command to run when starting the container
CMD ["apache2ctl", "-D", "FOREGROUND"]

