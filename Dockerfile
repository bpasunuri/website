FROM bpasunuri/webapp

# Copy your application files to the web server directory
COPY . /var/www/html

# Expose port 80
EXPOSE 80

# Start Nginx in the foreground
CMD ["nginx", "-g", "daemon off;"]
