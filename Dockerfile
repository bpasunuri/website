# Use the pre-built container for the application
FROM bpasunuri/webapp

# Copy the application code to the specified directory
COPY . /var/www/html

# Expose port 80
EXPOSE 80

# Set the default command to run the application
CMD ["apache2-foreground"]
