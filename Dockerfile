FROM nginxinc/nginx-unprivileged:1.27.2-alpine-slim

COPY nginx.conf /etc/nginx/nginx.conf