FROM nginxinc/nginx-unprivileged:1.25.4-alpine-slim

COPY nginx.conf /etc/nginx/nginx.conf