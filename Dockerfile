FROM nginxinc/nginx-unprivileged:1.29.1-alpine-slim

COPY nginx.conf /etc/nginx/nginx.conf