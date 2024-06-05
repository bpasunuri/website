# Use a pre-built web application image
FROM hshar/webapp

# Set the working directory in the container
WORKDIR /var/www/html

# Copy the application code to the container
COPY . .

# Expose port 80
EXPOSE 80

# Start the web server
CMD ["apache2-foreground"]
