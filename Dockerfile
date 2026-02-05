FROM nginx:alpine

# Remove default nginx config
RUN rm /etc/nginx/conf.d/default.conf

# Copy our nginx config
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Create web root
WORKDIR /usr/share/nginx/html

# Explicitly copy required files
COPY index.html .

# Fix permissions
RUN chmod -R 755 /usr/share/nginx/html

EXPOSE 8080
CMD ["nginx", "-g", "daemon off;"]
