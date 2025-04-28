FROM nginxinc/nginx-unprivileged:1.27.5-alpine-slim

COPY nginx.conf /etc/nginx/nginx.conf