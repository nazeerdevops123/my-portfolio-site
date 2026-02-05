# Use a lightweight web server image
FROM nginx:alpine

# Remove default nginx website
RUN rm -rf /usr/share/nginx/html/*

# Copy your static files
COPY . /usr/share/nginx/html

# Expose the port Hyperlift expects
EXPOSE 8080

# Start nginx (serves static files)
CMD ["nginx", "-g", "daemon off;"]
