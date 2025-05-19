FROM nginx:alpine

# Create custom HTML directory
RUN mkdir -p /var/www/html && rm -rf /usr/share/nginx/html

# Copy website files to /var/www/html
COPY . /var/www/html

# Update Nginx config to serve from /var/www/html
RUN sed -i 's|/usr/share/nginx/html|/var/www/html|g' /etc/nginx/conf.d/default.conf

# Expose port 80
EXPOSE 80
