FROM cgr.dev/chainguard/nginx:latest@sha256:f3b23b319f3ccb68cdb01e485427e49f2e88689071173e6dbe93c4dfc7a9a535

COPY nginx.conf /etc/nginx/nginx.conf
