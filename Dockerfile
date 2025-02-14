FROM nginxinc/nginx-unprivileged:1.27.4-alpine-slim

COPY nginx.conf /etc/nginx/nginx.conf