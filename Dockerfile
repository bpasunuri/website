# Use the pre-built container as the base image
FROM bpasunuri/webapp

# Copy the application code to the web server directory
COPY . /var/www/html

# Copy the entrypoint script to the desired location
COPY entrypoint.sh /usr/local/bin/entrypoint.sh

# Set execute permissions for the entrypoint script
RUN chmod +x /usr/local/bin/entrypoint.sh

# Expose port 80 to the outside world
EXPOSE 80

# Define the default command to run when starting the container
CMD ["/usr/local/bin/entrypoint.sh"]
