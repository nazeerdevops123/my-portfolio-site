FROM nginx:alpine

# Remove default config completely
RUN rm /etc/nginx/conf.d/default.conf

RUN rm -rf /var/www/html

# Copy our nginx config
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Copy site files
COPY index.html /var/www/html

# Fix permissions so nginx user can read files
RUN chmod -R 755 /usr/share/nginx/html

EXPOSE 8080

CMD ["nginx", "-g", "daemon off;"]
