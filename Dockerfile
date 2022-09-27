FROM nginxinc/nginx-unprivileged:1.23-alpine

COPY nginx.conf /etc/nginx/nginx.conf