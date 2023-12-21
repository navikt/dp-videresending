FROM nginxinc/nginx-unprivileged:1.25-alpine

COPY nginx.conf /etc/nginx/nginx.conf