FROM nginxinc/nginx-unprivileged:1.23.2-alpine

COPY nginx.conf /etc/nginx/nginx.conf