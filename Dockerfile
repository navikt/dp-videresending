FROM nginxinc/nginx-unprivileged:1.27.0-alpine-slim

COPY nginx.conf /etc/nginx/nginx.conf