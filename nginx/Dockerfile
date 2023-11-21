# Pull in the from the official nginx image.
FROM nginx:alpine

EXPOSE 80

# Copy over the custom default configs.
COPY default.conf /etc/nginx/conf.d/default.conf

# Start nginx in the foreground to play nicely with Docker.
CMD ["nginx", "-g", "daemon off;"]
