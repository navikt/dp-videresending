FROM cgr.dev/chainguard/nginx:latest@sha256:7b3bbe97d6ba4be0a00719e08abd483b7d18ae46b65f5c20b83a681691d9e691

COPY nginx.conf /etc/nginx/nginx.conf
