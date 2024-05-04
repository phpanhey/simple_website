# Use Nginx as the base image
FROM nginx:latest

# Copy the static website files into the container
COPY . /usr/share/nginx/html

# Copy SSL certificates and private key
COPY yourdomain.key /etc/ssl/private/philipp-panhey.key
COPY chained.crt /etc/ssl/certs/chained.crt

# Copy custom Nginx config
COPY default.conf /etc/nginx/conf.d/default.conf

# Expose port 80 for HTTP and 443 for HTTPS
EXPOSE 80 443
