# Use Nginx as the base image
FROM nginx:latest

# Copy the static website files into the container
COPY . /usr/share/nginx/html

# Expose port 80 to the outside world
EXPOSE 80
