# Use the official Nginx image from the DockerHub
FROM nginx

# Remove the default Nginx welcome page
RUN rm /usr/share/nginx/html/index.html

# Add our "Hello World" HTML file
ADD hello.html /usr/share/nginx/html/index.html
