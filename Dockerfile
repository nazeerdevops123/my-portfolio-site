FROM nginx:alpine

# Hyperlift expects 8080, not 80
RUN sed -i 's/listen\s\+80;/listen 8080;/g' /etc/nginx/conf.d/default.conf

# Remove default site
RUN rm -rf /usr/share/nginx/html/*

# Copy static files
COPY . /usr/share/nginx/html

# Expose Hyperlift port
EXPOSE 8080

# Run nginx in foreground (VERY IMPORTANT)
CMD ["nginx", "-g", "daemon off;"]
